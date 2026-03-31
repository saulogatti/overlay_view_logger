import 'dart:convert';

import 'package:overlay_view_logger/src/data/datasource/helpers/disk_storage.dart';
import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/map_type_registers_model.dart';

class JsonObjectRegisterDataSource implements RegisterDataSourceProvider {
  final String _directoryPath = 'registers';
  final String _fileName = 'registers.json';

  JsonObjectRegisterDataSource();

  @override
  Future<MapTypeRegistersModel> getData() async {
    final registers = await DiskStorage.readString(
      directoryPath: _directoryPath,
      fileName: _fileName,
    );
    if (registers == null) {
      return MapTypeRegistersModel(registers: {});
    }
    final mapJson = Map<String, dynamic>.from(
      jsonDecode(registers) as Map<String, dynamic>,
    );
    final listRegistersModel = MapTypeRegistersModel.fromJson(
      Map<String, dynamic>.from(mapJson),
    );
    return listRegistersModel;
  }

  @override
  Future<void> saveData(MapTypeRegistersModel data) async {
    await DiskStorage.saveString(
      directoryPath: _directoryPath,
      fileName: _fileName,
      content: jsonEncode(data.toJson()),
    );
  }
}
