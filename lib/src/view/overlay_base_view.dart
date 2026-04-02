import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_view_logger/src/core/type_register.dart';
import 'package:overlay_view_logger/src/domain/entities/register_entitie.dart';

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
          OverlayBlocStateInitial() => _buildSuccessEmpty(),
          OverlayBlocStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          OverlayBlocStateError(error: final error) => Center(
            child: Text(error.toString()),
          ),
          OverlayBlocStateSuccess(registers: final registers) =>
            registers.isEmpty
                ? _buildSuccessEmpty()
                : Column(
                    children: [
                      _buildSuccessEmpty(),
                      Expanded(child: ListWidget(registers: registers)),
                    ],
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

  Widget _buildSuccessEmpty() {
    return Center(
      child: TextButton(
        onPressed: () {
          context.read<OverlayBloc>().addRegister(
            RegisterEntity(
              title: 'Teste',
              description: 'Teste',
              tag: 'Teste',
              typeObject: 'Teste',
              typeRegister: TypeRegister.debug,
            ),
          );
          context.read<OverlayBloc>().addRegister(
            RegisterEntity(
              title: 'Teste',
              description: 'Teste',
              tag: 'Teste',
              typeObject: 'Teste',
              typeRegister: TypeRegister.info,
            ),
          );
          context.read<OverlayBloc>().addRegister(
            RegisterEntity(
              title: 'Teste',
              description: 'Teste',
              tag: 'Teste',
              typeObject: 'Teste',
              typeRegister: TypeRegister.warning,
            ),
          );
          context.read<OverlayBloc>().addRegister(
            RegisterEntity(
              title: 'Teste',
              description: StackTrace.current.toString(),
              tag: 'Teste Do tipo de erro',
              typeObject: runtimeType.toString(),
              typeRegister: TypeRegister.error,
            ),
          );
        },
        child: const Text('Adicionar registro'),
      ),
    );
  }
}
