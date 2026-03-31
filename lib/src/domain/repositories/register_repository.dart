import '../../core/errors/error_obj.dart';
import '../../core/result/result_obj.dart';
import '../entities/register_entitie.dart';

abstract interface class RegisterRepository {
  Future<Result<void, ErrorObj>> addRegister(RegisterEntity register);
  Future<Result<List<RegisterEntity>, ErrorObj>> getAllRegisters();
  Future<Result<List<RegisterEntity>, ErrorObj>> getRegistersByType({
    required TypeRegister type,
  });
}
