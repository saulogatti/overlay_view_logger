import 'dart:convert';

import 'package:overlay_view_logger/src/data/datasource/helpers/disk_storage.dart';
import 'package:overlay_view_logger/src/data/datasource/register_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_registers_model.dart';

class JsonObjectRegisterDataSource implements RegisterDataSourceProvider {
  final String _directoryPath = 'registers';
  final String _fileName = 'registers.json';

  JsonObjectRegisterDataSource();

  @override
  Future<ListRegistersModel> getListRegisters() async {
    final registers = await DiskStorage.readString(
      directoryPath: _directoryPath,
      fileName: _fileName,
    );
    if (registers == null) {
      return ListRegistersModel(registers: {});
    }
    final mapJson = Map<String, dynamic>.from(
      jsonDecode(registers) as Map<String, dynamic>,
    );
    final listRegistersModel = ListRegistersModel.fromJson(
      Map<String, dynamic>.from(mapJson),
    );
    return listRegistersModel;
  }

  @override
  Future<void> saveListRegisters(ListRegistersModel listRegisters) async {
    await DiskStorage.saveString(
      directoryPath: _directoryPath,
      fileName: _fileName,
      content: jsonEncode(listRegisters.toJson()),
    );
  }
}
