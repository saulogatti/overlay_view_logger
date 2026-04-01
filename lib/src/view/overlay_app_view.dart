import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/register_repository_impl.dart';
import 'controllers/overlay_bloc.dart';
import 'overlay_base_view.dart';

class OverlayAppView extends StatelessWidget {
  const OverlayAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OverlayBloc(registerRepository: RegisterRepositoryImpl()),
      child: const OverlayBaseView(),
    );
  }
}
