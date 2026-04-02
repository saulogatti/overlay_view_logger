import 'package:flutter/material.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

extension RegistryExtension on RegisterEntity {
  Color get color {
    switch (typeRegister) {
      case TypeRegister.debug:
        return Colors.blue;
      case TypeRegister.info:
        return Colors.green;
      case TypeRegister.warning:
        return Colors.orange;
      case TypeRegister.error:
        return Colors.red;
    }
  }

  String get formattedCreatedAt =>
      "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}:${createdAt.second.toString().padLeft(2, '0')}.${createdAt.millisecond.toString().padLeft(3, '0')}";
}
