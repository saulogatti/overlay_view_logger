import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/list_type_registers_model.dart';

// Nome da classe ? RegisterDataSourceProvider
abstract interface class RegisterDataSourceProvider {
  Future<ListTypeRegistersModel> getData(TypeRegister typeRegister);

  Future<void> saveData(ListTypeRegistersModel data);
}
