import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/register_provider.dart';
import 'package:overlay_view_logger/src/data/models/map_type_registers_model.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

/// Data Manager para gerenciar os registros
/// Tem apenas lista de tipos de registro (debug, info, warning, error)
/// Salva e pega a lista de registros
/// adiciona na lista de registros e devolve a lista de registros tipo TypeRegister
class DataManager {
  final RegisterDataSourceProvider registerProvider;
  MapTypeRegistersModel mapTypeRegisters = MapTypeRegistersModel(registers: {});
  DataManager({required this.registerProvider}) {
    _init();
  }
  Future<List<RegisterEntity>> getListRegisters() async {
    await _init();
    return mapTypeRegisters.getRegistersByType(null);
  }

  Future<List<RegisterEntity>> getRegistersByType({
    required TypeRegister type,
  }) async {
    await _init();
    return mapTypeRegisters.getRegistersByType(type);
  }

  Future<void> saveListRegisters(RegisterEntity register) async {
    await _init();
    mapTypeRegisters.addRegister(
      RegisterModel(
        title: register.title,
        description: register.description,
        tag: register.tag,
        typeObject: register.typeObject,
        typeRegister: register.typeRegister,
        updatedAt: register.updatedAt,
      ),
    );
    await registerProvider.saveListRegisters(mapTypeRegisters);
  }

  Future<void> _init() async {
    if (mapTypeRegisters.registers.isEmpty) {
      mapTypeRegisters = await registerProvider.getListRegisters();
    }
  }
}
