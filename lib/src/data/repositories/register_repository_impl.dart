import 'dart:async';

import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/datasource/drivers/memory_object_data_source.dart';
import 'package:overlay_view_logger/src/data/manager/data_manager.dart';

import '../../core/errors/error_obj.dart';
import '../../core/result/result_obj.dart';
import '../../domain/entities/register_entitie.dart';
import '../../domain/repositories/register_repository.dart';

/// Repositório que persiste e consulta [RegisterEntity] usando [DataManager].
///
/// Esta implementação encapsula a interação com a camada de dados e devolve o
/// resultado no formato [Result], evitando propagar exceções para a camada de
/// view (failures são convertidas em [ErrorObj]).
class RegisterRepositoryImpl implements RegisterRepository {
  static RegisterRepositoryImpl? _instance;
  final DataManager dataManager = DataManager(
    registerProvider: MemoryObjectDataSource(),
  );

  /// Retorna uma instância singleton do repositório.
  factory RegisterRepositoryImpl() {
    _instance ??= RegisterRepositoryImpl._internal();
    return _instance!;
  }
  RegisterRepositoryImpl._internal();

  @override
  /// Adiciona um [RegisterEntity] ao armazenamento e retorna a lista atual.
  ///
  /// Parâmetros:
  /// - `register`: entidade de registro a ser adicionada.
  ///
  /// Retorna:
  /// Um [Result] com a lista de registros atualizada em caso de sucesso, ou
  /// `Result.failure(ErrorObj)` em caso de falha.
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
  /// Retorna todos os registros persistidos, agregados por tipo.
  ///
  /// Retorna:
  /// Um [Result] contendo a lista completa de registros em caso de sucesso, ou
  /// `Result.failure(ErrorObj)` em caso de falha.
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
  /// Retorna todos os registros persistidos para o tipo informado.
  ///
  /// Parâmetros:
  /// - `type`: tipo do registro a ser consultado.
  ///
  /// Retorna:
  /// Um [Result] com a lista de registros daquele tipo em caso de sucesso, ou
  /// `Result.failure(ErrorObj)` em caso de falha.
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
  /// Remove todos os registros persistidos, independente do tipo.
  ///
  /// Retorna:
  /// Um [Result] com `null` em caso de sucesso, ou `Result.failure(ErrorObj)`
  /// em caso de falha.
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
  /// Remove todos os registros persistidos para o tipo informado.
  ///
  /// Parâmetros:
  /// - `type`: tipo de registro a ser removido.
  ///
  /// Retorna:
  /// Um [Result] com `null` em caso de sucesso, ou `Result.failure(ErrorObj)`
  /// em caso de falha.
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
