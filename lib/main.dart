import 'package:flutter/material.dart';
import 'package:overlay_view_logger/overlay_register.dart';

void main() {
  runApp(const MainApp());
}

/// {@category ui}
/// Página inicial do exemplo, com ações para exibir/remover o overlay.
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

/// {@category ui}
/// Widget raiz do app, responsável por configurar tema e rota inicial.
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: const HomePage(),
      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Log Widget'),
        actions: [
          IconButton(
            onPressed: () {
              final Size size = MediaQuery.of(context).size;
              OverlayAppViewManager.showOverlayAppView(
                context,
                size.width,
                size.height / 2,
              );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              OverlayAppViewManager.removeOverlayAppView();
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: const Center(child: Text('Custom Log Widget')),
    );
  }
}
