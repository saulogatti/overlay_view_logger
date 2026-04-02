import 'package:overlay_view_logger/src/core/type_register.dart';

import '../../core/errors/error_obj.dart';
import '../../core/result/result_obj.dart';
import '../entities/register_entitie.dart';

/// {@category controllers}
/// Contrato do repositório responsável por operar dados de `RegisterEntity`.
abstract interface class RegisterRepository {
  Future<Result<List<RegisterEntity>, ErrorObj>> addRegister(
    RegisterEntity register,
  );
  Future<Result<List<RegisterEntity>, ErrorObj>> getAllRegisters();
  Future<Result<List<RegisterEntity>, ErrorObj>> getRegistersByType({
    required TypeRegister type,
  });
  // Remove todo
  Future<Result<void, ErrorObj>> removeAllRegisters();
  // Remove todo por tipo de registro
  Future<Result<void, ErrorObj>> removeRegistersByType({
    required TypeRegister type,
  });
}
