import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/drivers/memory_object_data_source.dart';
import 'package:overlay_view_logger/src/data/manager/data_manager.dart';

import '../../core/errors/error_obj.dart';
import '../../core/result/result_obj.dart';
import '../../domain/entities/register_entitie.dart';
import '../../domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final DataManager dataManager = DataManager(
    registerProvider: MemoryObjectDataSource(),
  );
  @override
  Future<Result<List<RegisterEntity>, ErrorObj>> addRegister(
    RegisterEntity register,
  ) async {
    try {
      final registers = await dataManager.addRegister(register);
      return Result.success(registers);
    } on Exception catch (error, stackTrace) {
      return Result.failure(
        ErrorObj(message: error.toString(), description: stackTrace.toString()),
      );
    }
  }

  @override
  Future<Result<List<RegisterEntity>, ErrorObj>> getAllRegisters() async {
    try {
      final registers = await dataManager.getAllRegisters();
      return Result.success(registers);
    } on Exception catch (error, stackTrace) {
      return Result.failure(
        ErrorObj(message: error.toString(), description: stackTrace.toString()),
      );
    }
  }

  @override
  Future<Result<List<RegisterEntity>, ErrorObj>> getRegistersByType({
    required TypeRegister type,
  }) async {
    try {
      final registers = await dataManager.getRegistersByType(type);
      return Result.success(registers);
    } on Exception catch (error, stackTrace) {
      return Result.failure(
        ErrorObj(message: error.toString(), description: stackTrace.toString()),
      );
    }
  }

  @override
  Future<Result<void, ErrorObj>> removeAllRegisters() async {
    try {
      await dataManager.removeAllRegisters();
      return Result.success(null);
    } on Exception catch (error, stackTrace) {
      return Result.failure(
        ErrorObj(message: error.toString(), description: stackTrace.toString()),
      );
    }
  }

  @override
  Future<Result<void, ErrorObj>> removeRegistersByType({
    required TypeRegister type,
  }) async {
    try {
      await dataManager.removeRegistersByType(typeRegister: type);
      return Result.success(null);
    } on Exception catch (error, stackTrace) {
      return Result.failure(
        ErrorObj(message: error.toString(), description: stackTrace.toString()),
      );
    }
  }
}
