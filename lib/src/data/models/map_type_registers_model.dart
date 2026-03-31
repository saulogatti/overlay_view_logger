import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';

part 'map_type_registers_model.g.dart';

@JsonSerializable()
class MapTypeRegistersModel {
  final Map<TypeRegister, List<RegisterModel>> registers;
  MapTypeRegistersModel({required this.registers});
  factory MapTypeRegistersModel.fromJson(Map<String, dynamic> json) =>
      _$MapTypeRegistersModelFromJson(json);
  void addRegister(RegisterModel register) {
    registers[register.typeRegister] ??= [];
    registers[register.typeRegister]!.add(register);
  }

  List<RegisterModel> getRegistersByType(TypeRegister? type) => type != null
      ? (registers[type] ?? [])
      : registers.values.toList().expand((e) => e).toList();
  Map<String, dynamic> toJson() => _$MapTypeRegistersModelToJson(this);
}
