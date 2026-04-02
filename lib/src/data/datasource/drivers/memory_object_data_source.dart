import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';

/// Fonte de dados em memória para registros por [TypeRegister].
///
/// Esta implementação mantém um mapa em memória com uma lista por tipo e
/// fornece leitura/escrita sem depender de persistência em disco.
final class MemoryObjectDataSource implements RegisterDataSourceProvider {
  late final Map<TypeRegister, ListTypeRegistersModel> _mapTypeRegisters;

  /// Cria uma instância inicializando listas vazias para todos os valores de
  /// [TypeRegister].
  MemoryObjectDataSource() {
    _mapTypeRegisters = <TypeRegister, ListTypeRegistersModel>{};
    for (final typeRegister in TypeRegister.values) {
      _mapTypeRegisters[typeRegister] = ListTypeRegistersModel(
        typeRegister: typeRegister,
      );
    }
  }

  @override
  /// Obtém os registros persistidos para o [typeRegister] informado.
  ///
  /// Parâmetros:
  /// - `typeRegister`: tipo de registro a consultar.
  ///
  /// Retorna:
  /// A lista de registros para o tipo informado.
  Future<ListTypeRegistersModel> getData(TypeRegister typeRegister) async {
    if (_mapTypeRegisters.containsKey(typeRegister)) {
      return _mapTypeRegisters[typeRegister]!;
    }
    return _mapTypeRegisters[typeRegister]!;
  }

  @override
  /// Persiste a lista de registros em memória.
  ///
  /// Parâmetros:
  /// - `data`: lista de registros e metadados do tipo a ser salva.
  ///
  /// Retorna:
  /// Um [Future] concluído quando a gravação em memória terminar.
  Future<void> saveData(ListTypeRegistersModel data) async {
    _mapTypeRegisters[data.typeRegister] = data;
  }
}
