import 'package:flutter/material.dart';

import '../../domain/entities/register_entitie.dart';
import '../register_details_view.dart';

class CardWidget extends StatelessWidget {
  final RegisterEntity register;
  const CardWidget({required this.register, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => RegisterDetailsView(register: register),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(register.createdAt.toIso8601String()),
              Text(register.title),
              Text(register.tag),
              Text(register.typeObject),
              Text(register.typeRegister.name),
            ],
          ),
        ),
      ),
    );
  }
}
