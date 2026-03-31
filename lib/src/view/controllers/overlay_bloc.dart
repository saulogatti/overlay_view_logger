import 'package:bloc/bloc.dart';
import 'package:overlay_register/src/domain/entities/register_entitie.dart';
import 'package:overlay_register/src/domain/repositories/register_repository.dart';
import 'package:overlay_register/src/view/controllers/overlay_bloc_state.dart';

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
    result.fold(
      onSuccess: (_) => emit(const OverlayBlocState.successEmpty()),
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }

  /// Pega todos os registros
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> getAllRegisters() async {
    emit(const OverlayBlocState.loading());
    final result = await _registerRepository.getAllRegisters();
    result.fold(
      onSuccess: (success) =>
          emit(OverlayBlocState.success(registers: success)),
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }

  /// Pega todos os registros por tipo
  /// [type] é o tipo de registro a ser buscado
  /// Retorna um estado de loading e depois um estado de success ou error
  Future<void> getRegistersByType(TypeRegister type) async {
    emit(const OverlayBlocState.loading());
    final result = await _registerRepository.getRegistersByType(type: type);
    result.fold(
      onSuccess: (success) =>
          emit(OverlayBlocState.success(registers: success)),
      onFailure: (error) => emit(OverlayBlocState.error(error: error)),
    );
  }
}
