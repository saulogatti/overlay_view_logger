// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overlay_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OverlayBlocState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayBlocState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverlayBlocState()';
}


}

/// @nodoc
class $OverlayBlocStateCopyWith<$Res>  {
$OverlayBlocStateCopyWith(OverlayBlocState _, $Res Function(OverlayBlocState) __);
}


/// Adds pattern-matching-related methods to [OverlayBlocState].
extension OverlayBlocStatePatterns on OverlayBlocState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OverlayBlocStateError value)?  error,TResult Function( OverlayBlocStateInitial value)?  initial,TResult Function( OverlayBlocStateLoading value)?  loading,TResult Function( OverlayBlocStateSuccess value)?  success,TResult Function( OverlayBlocStateSuccessEmpty value)?  successEmpty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OverlayBlocStateError() when error != null:
return error(_that);case OverlayBlocStateInitial() when initial != null:
return initial(_that);case OverlayBlocStateLoading() when loading != null:
return loading(_that);case OverlayBlocStateSuccess() when success != null:
return success(_that);case OverlayBlocStateSuccessEmpty() when successEmpty != null:
return successEmpty(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OverlayBlocStateError value)  error,required TResult Function( OverlayBlocStateInitial value)  initial,required TResult Function( OverlayBlocStateLoading value)  loading,required TResult Function( OverlayBlocStateSuccess value)  success,required TResult Function( OverlayBlocStateSuccessEmpty value)  successEmpty,}){
final _that = this;
switch (_that) {
case OverlayBlocStateError():
return error(_that);case OverlayBlocStateInitial():
return initial(_that);case OverlayBlocStateLoading():
return loading(_that);case OverlayBlocStateSuccess():
return success(_that);case OverlayBlocStateSuccessEmpty():
return successEmpty(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OverlayBlocStateError value)?  error,TResult? Function( OverlayBlocStateInitial value)?  initial,TResult? Function( OverlayBlocStateLoading value)?  loading,TResult? Function( OverlayBlocStateSuccess value)?  success,TResult? Function( OverlayBlocStateSuccessEmpty value)?  successEmpty,}){
final _that = this;
switch (_that) {
case OverlayBlocStateError() when error != null:
return error(_that);case OverlayBlocStateInitial() when initial != null:
return initial(_that);case OverlayBlocStateLoading() when loading != null:
return loading(_that);case OverlayBlocStateSuccess() when success != null:
return success(_that);case OverlayBlocStateSuccessEmpty() when successEmpty != null:
return successEmpty(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ErrorObj error)?  error,TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<RegisterEntity> registers)?  success,TResult Function()?  successEmpty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OverlayBlocStateError() when error != null:
return error(_that.error);case OverlayBlocStateInitial() when initial != null:
return initial();case OverlayBlocStateLoading() when loading != null:
return loading();case OverlayBlocStateSuccess() when success != null:
return success(_that.registers);case OverlayBlocStateSuccessEmpty() when successEmpty != null:
return successEmpty();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ErrorObj error)  error,required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<RegisterEntity> registers)  success,required TResult Function()  successEmpty,}) {final _that = this;
switch (_that) {
case OverlayBlocStateError():
return error(_that.error);case OverlayBlocStateInitial():
return initial();case OverlayBlocStateLoading():
return loading();case OverlayBlocStateSuccess():
return success(_that.registers);case OverlayBlocStateSuccessEmpty():
return successEmpty();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ErrorObj error)?  error,TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<RegisterEntity> registers)?  success,TResult? Function()?  successEmpty,}) {final _that = this;
switch (_that) {
case OverlayBlocStateError() when error != null:
return error(_that.error);case OverlayBlocStateInitial() when initial != null:
return initial();case OverlayBlocStateLoading() when loading != null:
return loading();case OverlayBlocStateSuccess() when success != null:
return success(_that.registers);case OverlayBlocStateSuccessEmpty() when successEmpty != null:
return successEmpty();case _:
  return null;

}
}

}

/// @nodoc


class OverlayBlocStateError implements OverlayBlocState {
  const OverlayBlocStateError({required this.error});
  

 final  ErrorObj error;

/// Create a copy of OverlayBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayBlocStateErrorCopyWith<OverlayBlocStateError> get copyWith => _$OverlayBlocStateErrorCopyWithImpl<OverlayBlocStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayBlocStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OverlayBlocState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $OverlayBlocStateErrorCopyWith<$Res> implements $OverlayBlocStateCopyWith<$Res> {
  factory $OverlayBlocStateErrorCopyWith(OverlayBlocStateError value, $Res Function(OverlayBlocStateError) _then) = _$OverlayBlocStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorObj error
});




}
/// @nodoc
class _$OverlayBlocStateErrorCopyWithImpl<$Res>
    implements $OverlayBlocStateErrorCopyWith<$Res> {
  _$OverlayBlocStateErrorCopyWithImpl(this._self, this._then);

  final OverlayBlocStateError _self;
  final $Res Function(OverlayBlocStateError) _then;

/// Create a copy of OverlayBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(OverlayBlocStateError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorObj,
  ));
}


}

/// @nodoc


class OverlayBlocStateInitial implements OverlayBlocState {
  const OverlayBlocStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayBlocStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverlayBlocState.initial()';
}


}




/// @nodoc


class OverlayBlocStateLoading implements OverlayBlocState {
  const OverlayBlocStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayBlocStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverlayBlocState.loading()';
}


}




/// @nodoc


class OverlayBlocStateSuccess implements OverlayBlocState {
  const OverlayBlocStateSuccess({required final  List<RegisterEntity> registers}): _registers = registers;
  

 final  List<RegisterEntity> _registers;
 List<RegisterEntity> get registers {
  if (_registers is EqualUnmodifiableListView) return _registers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_registers);
}


/// Create a copy of OverlayBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayBlocStateSuccessCopyWith<OverlayBlocStateSuccess> get copyWith => _$OverlayBlocStateSuccessCopyWithImpl<OverlayBlocStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayBlocStateSuccess&&const DeepCollectionEquality().equals(other._registers, _registers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_registers));

@override
String toString() {
  return 'OverlayBlocState.success(registers: $registers)';
}


}

/// @nodoc
abstract mixin class $OverlayBlocStateSuccessCopyWith<$Res> implements $OverlayBlocStateCopyWith<$Res> {
  factory $OverlayBlocStateSuccessCopyWith(OverlayBlocStateSuccess value, $Res Function(OverlayBlocStateSuccess) _then) = _$OverlayBlocStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<RegisterEntity> registers
});




}
/// @nodoc
class _$OverlayBlocStateSuccessCopyWithImpl<$Res>
    implements $OverlayBlocStateSuccessCopyWith<$Res> {
  _$OverlayBlocStateSuccessCopyWithImpl(this._self, this._then);

  final OverlayBlocStateSuccess _self;
  final $Res Function(OverlayBlocStateSuccess) _then;

/// Create a copy of OverlayBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? registers = null,}) {
  return _then(OverlayBlocStateSuccess(
registers: null == registers ? _self._registers : registers // ignore: cast_nullable_to_non_nullable
as List<RegisterEntity>,
  ));
}


}

/// @nodoc


class OverlayBlocStateSuccessEmpty implements OverlayBlocState {
  const OverlayBlocStateSuccessEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayBlocStateSuccessEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverlayBlocState.successEmpty()';
}


}




// dart format on
