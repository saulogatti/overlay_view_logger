// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_type_registers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapTypeRegistersModel _$MapTypeRegistersModelFromJson(
  Map<String, dynamic> json,
) => MapTypeRegistersModel(
  registers: (json['registers'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      $enumDecode(_$TypeRegisterEnumMap, k),
      (e as List<dynamic>)
          .map((e) => RegisterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$MapTypeRegistersModelToJson(
  MapTypeRegistersModel instance,
) => <String, dynamic>{
  'registers': instance.registers.map(
    (k, e) =>
        MapEntry(_$TypeRegisterEnumMap[k]!, e.map((e) => e.toJson()).toList()),
  ),
};

const _$TypeRegisterEnumMap = {
  TypeRegister.debug: 'debug',
  TypeRegister.info: 'info',
  TypeRegister.warning: 'warning',
  TypeRegister.error: 'error',
};
