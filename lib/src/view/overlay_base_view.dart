import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/overlay_bloc.dart';
import 'controllers/overlay_bloc_state.dart';
import 'widgets/list_widget.dart';

class OverlayBaseView extends StatefulWidget {
  const OverlayBaseView({super.key});

  @override
  State<OverlayBaseView> createState() => _OverlayBaseViewState();
}

class _OverlayBaseViewState extends State<OverlayBaseView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverlayBloc, OverlayBlocState>(
      builder: (context, state) {
        return switch (state) {
          OverlayBlocStateInitial() => const Center(
            child: CircularProgressIndicator(),
          ),
          OverlayBlocStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          OverlayBlocStateError(error: final error) => Center(
            child: Text(error.toString()),
          ),
          OverlayBlocStateSuccess(registers: final registers) =>
            registers.isEmpty
                ? const Center(child: Text('Nenhum registro encontrado'))
                : ListWidget(registers: registers),
          OverlayBlocStateSuccessEmpty() => const Center(
            child: Center(child: Text('Nenhum registro adicionado ainda')),
          ),
        };
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<OverlayBloc>().getAllRegisters();
  }
}
