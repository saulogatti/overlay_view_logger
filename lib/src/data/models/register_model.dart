import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_register/src/domain/entities/register_entitie.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.id,
    required super.title,
    required super.description,
    required super.tag,
    required super.typeObject,
    required super.typeRegister,
    required super.updatedAt,
    super.createdAt,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
