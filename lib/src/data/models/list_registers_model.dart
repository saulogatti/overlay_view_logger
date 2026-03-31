import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';

part 'list_registers_model.g.dart';

@JsonSerializable()
class ListRegistersModel {
  final Map<TypeRegister, List<RegisterModel>> registers;
  ListRegistersModel({required this.registers});
  factory ListRegistersModel.fromJson(Map<String, dynamic> json) =>
      _$ListRegistersModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListRegistersModelToJson(this);
}
