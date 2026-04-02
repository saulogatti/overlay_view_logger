# overlay_view_logger

Biblioteca Flutter para exibir uma visão de logs em `Overlay`, com suporte a
arrastar a janela na tela e gerenciamento simples por API estática.

## O que este pacote oferece

- Exibição de painel de logs em `Overlay` via `OverlayEntry`
- API pública simples por `OverlayAppViewManager`
- Organização em camadas (`core`, `domain`, `data`, `view`)
- Padrão de retorno com `Result<Success, ErrorObj>` nas operações de dados

## API pública

Entrada principal do pacote:

- `lib/overlay_register.dart`

Classe principal para controlar o overlay:

- `OverlayAppViewManager.showOverlayAppView(context, width, height)`
- `OverlayAppViewManager.removeOverlayAppView(context)`
- `OverlayAppViewManager.hideOverlay(context)`

## Exemplo rápido

```dart
import 'package:flutter/material.dart';
import 'package:overlay_view_logger/overlay_register.dart';

class ExampleActions extends StatelessWidget {
	const ExampleActions({super.key});

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				IconButton(
					onPressed: () {
						final size = MediaQuery.of(context).size;
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
						OverlayAppViewManager.removeOverlayAppView(context);
					},
					icon: const Icon(Icons.remove),
				),
			],
		);
	}
}
```

> Observação: `width` e `height` devem ser maiores que `0`.

## Arquitetura

Estrutura principal em `lib/src/`:

- `core/`: tipos compartilhados, erros e `Result`
- `domain/`: entidades e contratos de repositório
- `data/`: models, datasource, manager e implementação de repositório
- `view/`: UI, widgets e estado (Cubit/BLoC)

Fluxo principal:

`view -> domain/repositories -> data/repositories -> data/manager -> data/datasource`

## Desenvolvimento

### Pré-requisitos

- Flutter SDK compatível com Dart `^3.11.4`

### Comandos úteis

```bash
flutter pub get
flutter analyze
flutter test
dart run build_runner build --delete-conflicting-outputs
```

## Convenções importantes

- Use imports relativos (`prefer_relative_imports`)
- Não edite arquivos gerados (`*.g.dart`, `*.freezed.dart`)
- Prefira `debugPrint` em vez de `print`

## Limitações atuais

- O arquivo `test/overlay_register_test.dart` ainda está como placeholder
	comentado e precisa de um `main()` válido para a suíte rodar corretamente.

## Documentação adicional

- Instruções de contribuição do agente: `.github/copilot-instructions.md`
- Diretrizes Dart/Flutter: `.github/instructions/dart-n-flutter.instructions.md`
- Diretrizes de teste: `.github/instructions/test-guidelines.instructions.md`
- API docs gerada: `docs/index.html`
- Histórico de mudanças: `CHANGELOG.md`
