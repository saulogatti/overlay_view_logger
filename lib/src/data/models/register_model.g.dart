// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      typeObject: json['typeObject'] as String,
      typeRegister: $enumDecode(_$TypeRegisterEnumMap, json['typeRegister']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tag': instance.tag,
      'typeObject': instance.typeObject,
      'typeRegister': _$TypeRegisterEnumMap[instance.typeRegister]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TypeRegisterEnumMap = {
  TypeRegister.debug: 'debug',
  TypeRegister.info: 'info',
  TypeRegister.warning: 'warning',
  TypeRegister.error: 'error',
};
