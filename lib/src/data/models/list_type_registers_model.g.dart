// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_type_registers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListTypeRegistersModel _$ListTypeRegistersModelFromJson(
  Map<String, dynamic> json,
) => ListTypeRegistersModel(
  typeRegister: $enumDecodeNullable(
    _$TypeRegisterEnumMap,
    json['typeRegister'],
  ),
  listRegisters: (json['listRegisters'] as List<dynamic>?)
      ?.map((e) => RegisterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ListTypeRegistersModelToJson(
  ListTypeRegistersModel instance,
) => <String, dynamic>{
  'listRegisters': instance.listRegisters.map((e) => e.toJson()).toList(),
  'typeRegister': _$TypeRegisterEnumMap[instance.typeRegister]!,
};

const _$TypeRegisterEnumMap = {
  TypeRegister.debug: 'debug',
  TypeRegister.info: 'info',
  TypeRegister.warning: 'warning',
  TypeRegister.error: 'error',
};
