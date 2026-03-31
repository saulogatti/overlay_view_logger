import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

/// Data Manager para gerenciar os registros
/// Tem apenas lista de tipos de registro (debug, info, warning, error)
/// Salva e pega a lista de registros
/// adiciona na lista de registros e devolve a lista de registros tipo TypeRegister
class DataManager {
  final RegisterDataSourceProvider registerProvider;

  final Map<TypeRegister, ListTypeRegistersModel> _mapTypeRegisters = {};

  DataManager({required this.registerProvider});
  Future<void> addRegister(RegisterEntity register) async {
    (await _getTypeRegisters(
      register.typeRegister,
    )).addRegister(RegisterModel.fromEntity(register));
    await registerProvider.saveData(
      await _getTypeRegisters(register.typeRegister),
    );
  }

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

  Future<List<RegisterEntity>> getRegistersByType(
    TypeRegister typeRegister,
  ) async {
    final listTypeRegistersModel = await _getTypeRegisters(typeRegister);
    return listTypeRegistersModel.listRegistersEntities;
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
  List<RegisterEntity> get listRegistersEntities =>
      listRegisters.map((e) => RegisterModel.toEntity(e)).toList();
}
