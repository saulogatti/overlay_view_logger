// import 'package:overlay_view_logger/src/core/type_register.dart';
// import 'package:overlay_view_logger/src/data/datasource/data_manager.dart';
// import 'package:overlay_view_logger/src/data/datasource/drivers/json_object_manager.dart';
// import 'package:overlay_view_logger/src/data/datasource/register_provider.dart';
// import 'package:overlay_view_logger/src/data/models/list_registers_model.dart';

// import '../../core/errors/error_obj.dart';
// import '../../core/result/result_obj.dart';
// import '../../domain/entities/register_entitie.dart';
// import '../../domain/repositories/register_repository.dart';

// class RegisterRepositoryImpl implements RegisterRepository {
//   final DataManager dataManager = DataManager(
//     registerProvider: JsonObjectRegisterDataSource(),
//   );
//   @override
//   Future<Result<void, ErrorObj>> addRegister(RegisterEntity register) async {
//     try {
//       await dataManager.saveListRegisters(ListRegistersModel(registers: {
//         register.typeRegister: [RegisterModel.fromEntity(register)],
//       }));
//       return Result.success(null);
//   }

//   @override
//   Future<Result<List<RegisterEntity>, ErrorObj>> getRegistersByType({
//     required TypeRegister type,
//   }) async {
//     try {
//       final registers = await dataManager.getRegistersByType(type: type);
//       return Result.success(registers);
//     } on Exception catch (error, stackTrace) {
//       return Result.failure(
//         ErrorObj(message: error.toString(), description: stackTrace.toString()),
//       );
//     }
//   }
// }
