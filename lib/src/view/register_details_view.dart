import 'package:flutter/material.dart';

import '../domain/entities/register_entitie.dart';

class RegisterDetailsView extends StatelessWidget {
  final RegisterEntity register;

  const RegisterDetailsView({required this.register, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do registro')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _DetailItem(label: 'Título', value: register.title),
          _DetailItem(label: 'Descrição', value: register.description),
          _DetailItem(label: 'Tag', value: register.tag),
          _DetailItem(label: 'Tipo do objeto', value: register.typeObject),
          _DetailItem(
            label: 'Tipo do registro',
            value: register.typeRegister.name,
          ),
          _DetailItem(
            label: 'Data de criação',
            value: register.createdAt.toIso8601String(),
          ),
          _DetailItem(
            label: 'Data de atualização',
            value: register.updatedAt.toIso8601String(),
          ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(value),
          ],
        ),
      ),
    );
  }
}
