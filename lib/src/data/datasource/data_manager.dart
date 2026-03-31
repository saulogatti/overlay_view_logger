import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/register_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_registers_model.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

class DataManager {
  final RegisterDataSourceProvider registerProvider;
  ListRegistersModel listRegisters = ListRegistersModel(registers: {});
  DataManager({required this.registerProvider});
  Future<ListRegistersModel> getListRegisters() async {
    listRegisters = await registerProvider.getListRegisters();
    return listRegisters;
  }

  Future<List<RegisterEntity>> getRegistersByType({
    required TypeRegister type,
  }) async {
    return listRegisters.registers[type] ?? [];
  }

  Future<void> saveListRegisters(ListRegistersModel listRegisters) async {
    await registerProvider.saveListRegisters(listRegisters);
  }
}
