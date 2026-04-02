// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      typeObject: json['typeObject'] as String,
      typeRegister: $enumDecode(_$TypeRegisterEnumMap, json['typeRegister']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'tag': instance.tag,
      'typeObject': instance.typeObject,
      'typeRegister': _$TypeRegisterEnumMap[instance.typeRegister]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$TypeRegisterEnumMap = {
  TypeRegister.debug: 'debug',
  TypeRegister.info: 'info',
  TypeRegister.warning: 'warning',
  TypeRegister.error: 'error',
};
