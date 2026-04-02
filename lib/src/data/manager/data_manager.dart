import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

/// Gerencia a persistência e o cache de registros por [TypeRegister].
///
/// Esta classe delega a leitura e escrita para um [RegisterDataSourceProvider]
/// e mantém um mapa em memória para reduzir leituras repetidas.
class DataManager {
  final RegisterDataSourceProvider registerProvider;

  final Map<TypeRegister, ListTypeRegistersModel> _mapTypeRegisters = {};

  /// Cria um [DataManager] usando o [registerProvider] como fonte de dados.
  DataManager({required this.registerProvider});

  /// Adiciona um [RegisterEntity] ao tipo correspondente e devolve a lista atualizada.
  ///
  /// Parâmetros:
  /// - `register`: entidade a ser adicionada.
  ///
  /// Retorna:
  /// Uma lista com os registros do tipo do [register] após a inclusão.
  Future<List<RegisterEntity>> addRegister(RegisterEntity register) async {
    final listTypeRegistersModel = await _getTypeRegisters(
      register.typeRegister,
    );
    listTypeRegistersModel.addRegister(RegisterModel.fromEntity(register));
    await registerProvider.saveData(listTypeRegistersModel);
    return listTypeRegistersModel.listRegistersEntities;
  }

  /// Retorna todos os registros persistidos, agregados por tipo.
  ///
  /// Retorna:
  /// Uma lista contendo registros de todos os [TypeRegister] disponíveis.
  Future<List<RegisterEntity>> getAllRegisters() async {
    if (_mapTypeRegisters.keys.length != TypeRegister.values.length) {
      for (final typeRegister in TypeRegister.values) {
        final listTypeRegistersModel = await _getTypeRegisters(typeRegister);
        _mapTypeRegisters[typeRegister] = listTypeRegistersModel;
      }
    }
    final listRegistersEntities = <RegisterEntity>[];
    for (final typeRegister in TypeRegister.values) {
      listRegistersEntities.addAll(
        _mapTypeRegisters[typeRegister]!.listRegistersEntities,
      );
    }
    return listRegistersEntities;
  }

  /// Retorna os registros persistidos para o [typeRegister] informado.
  ///
  /// Parâmetros:
  /// - `typeRegister`: tipo de registro a ser consultado.
  ///
  /// Retorna:
  /// A lista de registros daquele tipo.
  Future<List<RegisterEntity>> getRegistersByType(
    TypeRegister typeRegister,
  ) async {
    final listTypeRegistersModel = await _getTypeRegisters(typeRegister);
    return listTypeRegistersModel.listRegistersEntities;
  }

  /// Remove todos os registros persistidos, independente do tipo.
  Future<void> removeAllRegisters() async {
    _mapTypeRegisters.clear();
    for (final typeRegister in TypeRegister.values) {
      await registerProvider.saveData(
        ListTypeRegistersModel(typeRegister: typeRegister),
      );
    }
  }

  /// Remove todos os registros persistidos para o tipo informado.
  ///
  /// Parâmetros:
  /// - `typeRegister`: tipo de registros a serem removidos.
  Future<void> removeRegistersByType({
    required TypeRegister typeRegister,
  }) async {
    _mapTypeRegisters.remove(typeRegister);
    await registerProvider.saveData(
      ListTypeRegistersModel(typeRegister: typeRegister),
    );
  }

  Future<ListTypeRegistersModel> _getTypeRegisters(
    TypeRegister typeRegister,
  ) async {
    if (_mapTypeRegisters.containsKey(typeRegister)) {
      return _mapTypeRegisters[typeRegister]!;
    }
    final listTypeRegistersModel = await registerProvider.getData(typeRegister);
    _mapTypeRegisters[typeRegister] = listTypeRegistersModel;
    return listTypeRegistersModel;
  }
}

extension on ListTypeRegistersModel {
  /// Converte a lista interna de [RegisterModel] para uma lista de [RegisterEntity].
  ///
  /// Retorna:
  /// Lista de entidades convertidas.
  List<RegisterEntity> get listRegistersEntities =>
      listRegisters.map((e) => RegisterModel.toEntity(e)).toList();
}
