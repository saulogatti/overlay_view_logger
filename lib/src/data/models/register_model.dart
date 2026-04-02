import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';

import '../../domain/entities/register_entitie.dart';

part 'register_model.g.dart';

/// Modelo serializável de [RegisterEntity] usado para persistência em JSON.
///
/// A conversão entre `RegisterEntity` e `RegisterModel` é feita via
/// [RegisterModel.fromEntity] e [RegisterModel.toEntity].
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

  /// Cria um [RegisterModel] a partir de uma [RegisterEntity].
  ///
  /// Parâmetros:
  /// - `register`: entidade de domínio a ser convertida.
  ///
  /// Retorna:
  /// Instância de [RegisterModel] equivalente.
  factory RegisterModel.fromEntity(RegisterEntity register) => RegisterModel(
    title: register.title,
    description: register.description,
    tag: register.tag,
    typeObject: register.typeObject,
    typeRegister: register.typeRegister,
    createdAt: register.createdAt,
  );

  /// Converte o JSON recebido em um [RegisterModel].
  ///
  /// Parâmetros:
  /// - `json`: mapa com os campos serializados.
  ///
  /// Retorna:
  /// Um [RegisterModel] instanciado a partir do JSON.
  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  /// Converte este [RegisterModel] em um mapa JSON.
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  /// Converte um [RegisterModel] em uma [RegisterEntity].
  ///
  /// Parâmetros:
  /// - `registerModel`: modelo serializável a ser convertido.
  ///
  /// Retorna:
  /// Entidade de domínio equivalente.
  static RegisterEntity toEntity(RegisterModel registerModel) => RegisterEntity(
    title: registerModel.title,
    description: registerModel.description,
    tag: registerModel.tag,
    typeObject: registerModel.typeObject,
    typeRegister: registerModel.typeRegister,
    createdAt: registerModel.createdAt,
  );
}
