import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';

part 'list_type_registers_model.g.dart';

/// Modelo de lista de registros
/// Tem apenas lista de registros
/// Salva e pega a lista de registros
/// adiciona na lista de registros e devolve a lista de registros tipo TypeRegister
@JsonSerializable(explicitToJson: true)
class ListTypeRegistersModel {
  /// Lista de registros
  final List<RegisterModel> _listRegisters;
  final TypeRegister _typeRegister;
  ListTypeRegistersModel({
    TypeRegister? typeRegister,
    List<RegisterModel>? listRegisters,
  }) : _listRegisters = listRegisters ?? [],
       _typeRegister = typeRegister ?? TypeRegister.debug;
  factory ListTypeRegistersModel.fromJson(Map<String, dynamic> json) =>
      _$ListTypeRegistersModelFromJson(json);
  List<RegisterModel> get listRegisters => List.from(_listRegisters);
  TypeRegister get typeRegister => _typeRegister;

  /// Adiciona um registro na lista de registros
  /// Se o tipo do registro não for o tipo da lista, lança uma exceção
  void addRegister(RegisterModel register) {
    if (register.typeRegister == _typeRegister) {
      _listRegisters.add(register);
    } else {
      throw Exception('Register type does not match the type of the list');
    }
  }

  /// Limpa a lista de registros
  void clear() {
    _listRegisters.clear();
  }

  /// Remove um registro da lista de registros
  /// Se o tipo do registro não for o tipo da lista, lança uma exceção
  void removeRegister(RegisterModel register) {
    if (register.typeRegister == _typeRegister) {
      _listRegisters.remove(register);
    } else {
      throw Exception('Register type does not match the type of the list');
    }
  }

  /// Converte a lista de registros para um JSON
  Map<String, dynamic> toJson() => _$ListTypeRegistersModelToJson(this);
}
