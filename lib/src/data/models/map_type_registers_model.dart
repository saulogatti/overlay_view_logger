import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';

part 'map_type_registers_model.g.dart';

/// Modelo de map de tipos de registro e lista de registros
/// Tem apenas lista de tipos de registro (debug, info, warning, error)
/// Salva e pega a lista de registros
/// adiciona na lista de registros e devolve a lista de registros tipo TypeRegister
@JsonSerializable(explicitToJson: true)
class MapTypeRegistersModel {
  /// Map de tipos de registro e lista de registros

  final Map<TypeRegister, List<RegisterModel>> _mapTypeRegisters;
  MapTypeRegistersModel({Map<TypeRegister, List<RegisterModel>>? registers})
    : _mapTypeRegisters = registers ?? {};
  factory MapTypeRegistersModel.fromJson(Map<String, dynamic> json) =>
      _$MapTypeRegistersModelFromJson(json);
  @JsonKey(name: 'registers')
  UnmodifiableMapView<TypeRegister, List<RegisterModel>> get registers =>
      UnmodifiableMapView(_mapTypeRegisters);
  void addRegister(RegisterModel register) {
    _mapTypeRegisters[register.typeRegister] ??= [];
    _mapTypeRegisters[register.typeRegister]!.add(register);
  }

  List<List<RegisterModel>> getAllRegisters() =>
      List.from(_mapTypeRegisters.values);
  List<RegisterModel> getRegistersByType(TypeRegister type) =>
      List.from(_mapTypeRegisters[type] ?? []);
  Map<String, dynamic> toJson() => _$MapTypeRegistersModelToJson(this);
}
