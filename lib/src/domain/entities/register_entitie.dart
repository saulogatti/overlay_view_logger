class RegisterEntity {
  final int id;
  final String title;
  final String description;
  final String tag;
  final String typeObject;
  final TypeRegister typeRegister;
  final DateTime createdAt;
  final DateTime updatedAt;

  RegisterEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.tag,
    required this.typeObject,
    required this.typeRegister,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}

enum TypeRegister { debug, info, warning, error }
