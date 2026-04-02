import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/data/models/register_model.dart';

part 'list_type_registers_model.g.dart';

/// Modelo de lista de registros para um [TypeRegister].
///
/// Contém a lista de [RegisterModel] associada a um tipo e oferece operações
/// para adicionar/remover registros e serializar o estado.
@JsonSerializable(explicitToJson: true)
class ListTypeRegistersModel {
  /// Lista de registros.
  final List<RegisterModel> _listRegisters;

  /// Tipo de registro.
  final TypeRegister _typeRegister;

  /// Cria uma instância para o [typeRegister] informado.
  ///
  /// Parâmetros:
  /// - `typeRegister`: tipo associado à lista. Quando omitido, usa
  ///   [TypeRegister.debug].
  /// - `listRegisters`: lista inicial de registros. Quando omitida, inicia
  ///   vazia.
  ListTypeRegistersModel({
    TypeRegister? typeRegister,
    List<RegisterModel>? listRegisters,
  }) : _listRegisters = listRegisters ?? [],
       _typeRegister = typeRegister ?? TypeRegister.debug;

  /// Cria uma instância a partir do JSON serializado.
  ///
  /// Parâmetros:
  /// - `json`: mapa com os campos serializados.
  ///
  /// Retorna:
  /// Uma instância de [ListTypeRegistersModel] equivalente.
  factory ListTypeRegistersModel.fromJson(Map<String, dynamic> json) =>
      _$ListTypeRegistersModelFromJson(json);

  /// Retorna uma visão imutável da lista de registros.
  ///
  /// Retorna:
  /// Uma [UnmodifiableListView] para evitar mutações externas.
  UnmodifiableListView<RegisterModel> get listRegisters =>
      UnmodifiableListView(_listRegisters);

  /// Retorna o tipo associado à lista.
  TypeRegister get typeRegister => _typeRegister;

  /// Adiciona um [register] à lista se o tipo for compatível.
  ///
  /// Parâmetros:
  /// - `register`: registro a ser adicionado.
  ///
  /// Observação:
  /// Se o tipo do [register] não for compatível com a lista, pode lançar uma
  /// exceção.
  void addRegister(RegisterModel register) {
    if (register.typeRegister == _typeRegister) {
      _listRegisters.add(register);
    } else {
      throw Exception('Register type does not match the type of the list');
    }
  }

  /// Limpa a lista de registros.
  void clear() {
    _listRegisters.clear();
  }

  /// Remove um [register] da lista se o tipo for compatível.
  ///
  /// Parâmetros:
  /// - `register`: registro a ser removido.
  ///
  /// Observação:
  /// Se o tipo do [register] não for compatível com a lista, pode lançar uma
  /// exceção.
  void removeRegister(RegisterModel register) {
    if (register.typeRegister == _typeRegister) {
      _listRegisters.remove(register);
    } else {
      throw Exception('Register type does not match the type of the list');
    }
  }

  /// Converte esta instância em um mapa serializável (JSON).
  ///
  /// Retorna:
  /// Um [Map] com os campos serializados desta instância.
  Map<String, dynamic> toJson() => _$ListTypeRegistersModelToJson(this);
}
