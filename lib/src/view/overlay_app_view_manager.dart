import 'package:flutter/material.dart';
import 'package:overlay_view_logger/src/view/overlay_app_view.dart';

class OverlayAppViewManager {
  static OverlayEntry? overlayEntry;

  static final ValueNotifier<Offset> _position = ValueNotifier(Offset.zero);

  static void hideOverlay(BuildContext context) {
    if (overlayEntry != null) {
      removeOverlayAppView(context);
    }
  }

  static void removeOverlayAppView(BuildContext context) {
    if (overlayEntry != null) {
      overlayEntry?.remove();
    }
    overlayEntry = null;
  }

  static void showOverlayAppView(
    BuildContext context,
    double width,
    double height,
  ) {
    if (overlayEntry != null) {
      removeOverlayAppView(context);
    }

    if (width == 0 || height == 0) {
      throw Exception('Width and height must be greater than 0');
    }

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
                  color: Colors.yellow,
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
