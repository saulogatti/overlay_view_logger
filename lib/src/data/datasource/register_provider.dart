import 'package:overlay_view_logger/src/data/models/list_registers_model.dart';

// Nome da classe ? RegisterDataSourceProvider
abstract interface class RegisterDataSourceProvider {
  Future<ListRegistersModel> getListRegisters();

  Future<void> saveListRegisters(ListRegistersModel listRegisters);
}
