import 'package:overlay_view_logger/src/core/errors/error_obj.dart';
import 'package:overlay_view_logger/src/core/result/result_obj.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';
import 'package:overlay_view_logger/src/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<Result<void, ErrorObj>> addRegister(RegisterEntity register) async {
    // TODO: Implementar addRegister
    return Result.success(null);
  }

  @override
  Future<Result<List<RegisterEntity>, ErrorObj>> getAllRegisters() async {
    // TODO: Implementar getAllRegisters
    await Future.delayed(const Duration(seconds: 1), () {});
    final List<RegisterEntity> registers = [
      RegisterEntity(
        id: 1,
        title: 'Register 1',
        tag: 'Tag 1',
        description: 'Description 1',
        typeObject: 'Type Object 1',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 2,
        title: 'Register 2',
        tag: 'Tag 2',
        description: 'Description 2',
        typeObject: 'Type Object 2',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 3,
        title: 'Register 3',
        tag: 'Tag 3',
        description: 'Description 3',
        typeObject: 'Type Object 3',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 4,
        title: 'Register 4',
        tag: 'Tag 4',
        description: 'Description 4',
        typeObject: 'Type Object 4',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 5,
        title: 'Register 5',
        tag: 'Tag 5',
        description: 'Description 5',
        typeObject: 'Type Object 5',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 6,
        title: 'Register 6',
        tag: 'Tag 6',
        description: 'Description 6',
        typeObject: 'Type Object 6',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 7,
        title: 'Register 7',
        tag: 'Tag 7',
        description: 'Description 7',
        typeObject: 'Type Object 7',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 8,
        title: 'Register 8',
        tag: 'Tag 8',
        description: 'Description 8',
        typeObject: 'Type Object 8',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 9,
        title: 'Register 9',
        tag: 'Tag 9',
        description: 'Description 9',
        typeObject: 'Type Object 9',
        typeRegister: TypeRegister.debug,
      ),
      RegisterEntity(
        id: 10,
        title: 'Register 10',
        tag: 'Tag 10',
        description: 'Description 10',
        typeObject: 'Type Object 10',
        typeRegister: TypeRegister.debug,
      ),
    ];
    return Result.success(registers);
  }

  @override
  Future<Result<List<RegisterEntity>, ErrorObj>> getRegistersByType({
    required TypeRegister type,
  }) async {
    // TODO: Implementar getRegistersByType
    return Result.failure(
      ErrorObj(
        message: 'Não esta implementado getRegistersByType',
        description: 'Description não esta implementado getRegistersByType',
      ),
    );
  }
}
