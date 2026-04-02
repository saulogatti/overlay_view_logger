import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';

import '../../domain/entities/register_entitie.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.title,
    required super.description,
    required super.tag,
    required super.typeObject,
    required super.typeRegister,
    super.createdAt,
  });

  factory RegisterModel.fromEntity(RegisterEntity register) => RegisterModel(
    title: register.title,
    description: register.description,
    tag: register.tag,
    typeObject: register.typeObject,
    typeRegister: register.typeRegister,
    createdAt: register.createdAt,
  );

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
  static RegisterEntity toEntity(RegisterModel registerModel) => RegisterEntity(
    title: registerModel.title,
    description: registerModel.description,
    tag: registerModel.tag,
    typeObject: registerModel.typeObject,
    typeRegister: registerModel.typeRegister,
    createdAt: registerModel.createdAt,
  );
}
