import 'package:overlay_view_logger/src/core/type_register.dart';

/// Entidade de registro
/// Tem apenas lista de tipos de registro (debug, info, warning, error)
/// Não tem id, pois é gerado pelo sistema
/// Tem createdAt e updatedAt, pois é gerado pelo sistema
/// Tem title, description, tag, typeObject, typeRegister
/// Tem createdAt e updatedAt, pois é gerado pelo sistema
/// Tem createdAt e updatedAt, pois é gerado pelo sistema
class RegisterEntity {
  final String title;
  final String description;
  final String tag;
  final String typeObject;
  final TypeRegister typeRegister;
  final DateTime createdAt;

  RegisterEntity({
    required this.title,
    required this.description,
    required this.tag,
    required this.typeObject,
    required this.typeRegister,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  @override
  String toString() {
    return 'RegisterEntity(title: $title, description: $description, tag: $tag, typeObject: $typeObject, typeRegister: $typeRegister, createdAt: $createdAt)';
  }
}
