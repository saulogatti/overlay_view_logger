import 'package:flutter/material.dart';
import 'package:overlay_view_logger/src/view/extensions/registry_extension.dart';

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
              // XX/XX/XXXX 00:00:00.000
              //  typeRegister [TypeObject]
              //    Title - Tag
              Text(
                register.formattedCreatedAt, textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: register.color),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    register.typeRegister.name.toUpperCase(),
                    style: TextStyle(color: register.color),
                  ),
                  Text(
                    "[${register.typeObject.toUpperCase()}]",
                    style: TextStyle(
                      color: register.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    register.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: register.color,
                    ),
                  ),
                  Text(
                    register.tag,
                    style: TextStyle(color: register.color),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Text(
                register.description,
                style: TextStyle(color: register.color),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
