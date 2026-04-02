import 'package:bloc/bloc.dart';
import 'package:overlay_view_logger/src/core/result/result_obj.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';

import '../../domain/entities/register_entitie.dart';
import '../../domain/repositories/register_repository.dart';
import 'overlay_bloc_state.dart';

/// {@category controllers}
/// Controller de estados do overlay: busca registros no repositório e emite
/// loading/success/error para a camada de visão.
class OverlayBloc extends Cubit<OverlayBlocState> {
  late final RegisterRepository _registerRepository;
  OverlayBloc({required RegisterRepository registerRepository})
    : super(const OverlayBlocState.initial()) {
    _registerRepository = registerRepository;
  }

  /// Adiciona um registro
  /// [register] é o registro a ser adicionado
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> addRegister(RegisterEntity register) async {
    emit(const OverlayBlocState.loading());
    final result = await _registerRepository.addRegister(register);

    switch (result) {
      case Success(value: final _):
        await _getAll();
      case Failure(:final error):
        emit(OverlayBlocState.error(error: error));
    }
  }

  /// Pega todos os registros
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> getAllRegisters() async {
    emit(const OverlayBlocState.loading());
    await _getAll();
  }

  /// Pega todos os registros por tipo
  /// [type] é o tipo de registro a ser buscado
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> getRegistersByType(TypeRegister type) async {
    emit(const OverlayBlocState.loading());
    final result = await _registerRepository.getRegistersByType(type: type);
    result.fold(
      onSuccess: (registers) {
        registers.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        emit(OverlayBlocState.success(registers: registers));
      },
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }

  /// Remove todos os registros
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> removeAllRegisters() async {
    emit(const OverlayBlocState.loading());
    final result = await _registerRepository.removeAllRegisters();

    result.fold(
      onSuccess: (success) => _getAll(),
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }

  /// Remove todos os registros por tipo
  /// [type] é o tipo de registro a ser removido
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> removeRegistersByType(TypeRegister type) async {
    emit(const OverlayBlocState.loading());
    final result = await _registerRepository.removeRegistersByType(type: type);

    result.fold(
      onSuccess: (success) => _getAll(),
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }

  Future<void> _getAll() async {
    final result = await _registerRepository.getAllRegisters();
    result.fold(
      onSuccess: (registers) {
        registers.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        emit(OverlayBlocState.success(registers: registers));
      },
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }
}
