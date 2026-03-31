import 'package:overlay_view_logger/src/core/errors/error_obj.dart';
import 'package:overlay_view_logger/src/core/result/result_obj.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

abstract interface class RegisterRepository {
  Future<Result<void, ErrorObj>> addRegister(RegisterEntity register);
  Future<Result<List<RegisterEntity>, ErrorObj>> getAllRegisters();
  Future<Result<List<RegisterEntity>, ErrorObj>> getRegistersByType({
    required TypeRegister type,
  });
}
