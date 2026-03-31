// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_registers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRegistersModel _$ListRegistersModelFromJson(Map<String, dynamic> json) =>
    ListRegistersModel(
      registers: (json['registers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          $enumDecode(_$TypeRegisterEnumMap, k),
          (e as List<dynamic>)
              .map((e) => RegisterModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$ListRegistersModelToJson(ListRegistersModel instance) =>
    <String, dynamic>{
      'registers': instance.registers.map(
        (k, e) => MapEntry(_$TypeRegisterEnumMap[k]!, e),
      ),
    };

const _$TypeRegisterEnumMap = {
  TypeRegister.debug: 'debug',
  TypeRegister.info: 'info',
  TypeRegister.warning: 'warning',
  TypeRegister.error: 'error',
};
