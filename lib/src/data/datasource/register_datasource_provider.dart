import 'package:overlay_view_logger/src/data/models/map_type_registers_model.dart';

// Nome da classe ? RegisterDataSourceProvider
abstract interface class RegisterDataSourceProvider {
  Future<MapTypeRegistersModel> getData();

  Future<void> saveData(MapTypeRegistersModel data);
}
