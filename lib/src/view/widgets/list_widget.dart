import 'package:flutter/material.dart';

import '../../domain/entities/register_entitie.dart';
import 'card_widget.dart';

class ListWidget extends StatelessWidget {
  final List<RegisterEntity> registers;
  const ListWidget({required this.registers, super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registers.length,
      itemBuilder: (context, index) => CardWidget(register: registers[index]),
    );
  }
}
