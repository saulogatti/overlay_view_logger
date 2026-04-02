import 'package:flutter/material.dart';

import 'overlay_app_view.dart';

/// {@category ui}
/// Responsável por controlar a exibição/remoção do `OverlayAppView` na tela.
class OverlayAppViewManager {
  static OverlayEntry? overlayEntry;

  static final ValueNotifier<Offset> _position = ValueNotifier(Offset.zero);

  static void removeOverlayAppView() {
    if (overlayEntry != null) {
      overlayEntry?.remove();
    }
    overlayEntry = null;
    _position.value = Offset.zero;
  }

  static void showOverlayAppView(
    BuildContext context,
    double width,
    double height,
  ) {
    if (overlayEntry != null) {
      removeOverlayAppView();
    }

    if (width == 0 || height == 0) {
      throw Exception('Width and height must be greater than 0');
    }
    _position.value = Offset(0, height / 2);
    overlayEntry = OverlayEntry(
      builder: (context) => ValueListenableBuilder<Offset>(
        valueListenable: _position,
        builder: (context, offset, child) {
          return Positioned(
            left: offset.dx,
            top: offset.dy,
            child: GestureDetector(
              // O segredo do drag está aqui
              onPanUpdate: (details) {
                _position.value += details.delta;
              },
              child: Material(
                child: Container(
                  color: Colors.black.withAlpha(128),
                  width: width,
                  height: height,
                  child: const OverlayAppView(),
                ),
              ),
            ),
          );
        },
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }
}
