import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/map_type_registers_model.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

/// Data Manager para gerenciar os registros
/// Tem apenas lista de tipos de registro (debug, info, warning, error)
/// Salva e pega a lista de registros
/// adiciona na lista de registros e devolve a lista de registros tipo TypeRegister
class DataManager {
  final RegisterDataSourceProvider registerProvider;
  MapTypeRegistersModel _mapTypeRegisters = MapTypeRegistersModel(
    registers: {},
  );
  late Future<void> _futureInitData;
  DataManager({required this.registerProvider}) {
    _futureInitData = _initData();
  }
  Future<void> addRegister(RegisterEntity register) async {
    await _futureInitData;
    _mapTypeRegisters.addRegister(
      RegisterModel(
        title: register.title,
        description: register.description,
        tag: register.tag,
        typeObject: register.typeObject,
        typeRegister: register.typeRegister,
        updatedAt: register.updatedAt,
      ),
    );
    await _saveData();
  }

  Future<List<RegisterEntity>> getAllRegisters() async {
    await _futureInitData;
    return _mapTypeRegisters
        .getAllRegisters()
        .expand((element) => element)
        .toList()
        .map((e) => RegisterModel.toEntity(e))
        .toList();
  }

  Future<void> _initData() async {
    _mapTypeRegisters = await registerProvider.getData();
  }

  Future<void> _saveData() async {
    await _futureInitData;
    await registerProvider.saveData(_mapTypeRegisters);
  }
}
