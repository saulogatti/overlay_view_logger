import 'dart:convert';
import 'dart:io';

import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/helpers/disk_storage.dart';
import 'package:overlay_view_logger/src/data/datasource/register_datasource_provider.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';

class JsonObjectRegisterDataSource implements RegisterDataSourceProvider {
  final String _directoryPath = 'registers';
  final String _fileName = 'registers_';

  JsonObjectRegisterDataSource();

  @override
  Future<ListTypeRegistersModel> getData(TypeRegister typeRegister) async {
    final registers = await DiskStorage.readString(
      directoryPath: _getDirectoryPath(typeRegister),
      fileName: _getFileName(typeRegister),
    );
    if (registers == null) {
      return ListTypeRegistersModel(typeRegister: typeRegister);
    }
    final mapJson = Map<String, dynamic>.from(
      jsonDecode(registers) as Map<String, dynamic>,
    );
    final listRegistersModel = ListTypeRegistersModel.fromJson(
      Map<String, dynamic>.from(mapJson),
    );
    return listRegistersModel;
  }

  @override
  Future<void> saveData(ListTypeRegistersModel data) async {
    await DiskStorage.saveString(
      directoryPath: _getDirectoryPath(data.typeRegister),
      fileName: _getFileName(data.typeRegister),
      content: jsonEncode(data.toJson()),
    );
  }

  String _getDirectoryPath(TypeRegister typeRegister) {
    return '$_directoryPath${Platform.pathSeparator}${typeRegister.name}';
  }

  String _getFileName(TypeRegister typeRegister) {
    return '$_fileName${typeRegister.name}.json';
  }
}
