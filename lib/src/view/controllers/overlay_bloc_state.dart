import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:overlay_view_logger/src/core/errors/error_obj.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

part 'overlay_bloc_state.freezed.dart';

@freezed
sealed class OverlayBlocState with _$OverlayBlocState {
  const factory OverlayBlocState.error({required ErrorObj error}) =
      OverlayBlocStateError;
  const factory OverlayBlocState.initial() = OverlayBlocStateInitial;
  const factory OverlayBlocState.loading() = OverlayBlocStateLoading;
  const factory OverlayBlocState.success({
    required List<RegisterEntity> registers,
  }) = OverlayBlocStateSuccess;
  const factory OverlayBlocState.successEmpty() = OverlayBlocStateSuccessEmpty;
}
