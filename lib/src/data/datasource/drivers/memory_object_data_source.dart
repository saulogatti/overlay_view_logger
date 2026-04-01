import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';

final class MemoryObjectDataSource implements RegisterDataSourceProvider {
  late final Map<TypeRegister, ListTypeRegistersModel> _mapTypeRegisters;

  MemoryObjectDataSource() {
    _mapTypeRegisters = <TypeRegister, ListTypeRegistersModel>{};
    for (final typeRegister in TypeRegister.values) {
      _mapTypeRegisters[typeRegister] = ListTypeRegistersModel(
        typeRegister: typeRegister,
      );
    }
  }

  @override
  Future<ListTypeRegistersModel> getData(TypeRegister typeRegister) async {
    if (_mapTypeRegisters.containsKey(typeRegister)) {
      return _mapTypeRegisters[typeRegister]!;
    }
    return _mapTypeRegisters[typeRegister]!;
  }

  @override
  Future<void> saveData(ListTypeRegistersModel data) async {
    _mapTypeRegisters[data.typeRegister] = data;
  }
}
