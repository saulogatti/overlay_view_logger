---
description: 'Instructions for writing Dart and Flutter code following the official recommendations.'
applyTo: '**/*.dart'
---

# Dart and Flutter

Diretrizes para escrever código Dart/Flutter neste workspace, alinhadas ao
`Effective Dart` e às convenções locais.

## Prioridade de referência

- Para regras de arquitetura e fluxo deste projeto, siga primeiro
  `.github/copilot-instructions.md`.
- Para testes, siga `.github/instructions/test-guidelines.instructions.md`.
- Use este arquivo para regras gerais de código Dart/Flutter.

## Regras específicas do repositório

- Preserve a arquitetura em camadas de `lib/src/`:
  `core/`, `domain/`, `data/`, `view/`.
- Mantenha o fluxo: `view -> domain/repositories -> data/repositories -> data/manager -> data/datasource`.
- Use imports relativos quando houver alternativa (`prefer_relative_imports`).
- Repositórios devem retornar `Result<Success, ErrorObj>` para a camada de
  view, em vez de propagar exceções como contrato principal.
- Não edite arquivos gerados (`*.g.dart`, `*.freezed.dart`); regenere com
  `dart run build_runner build --delete-conflicting-outputs`.
- Evite `print`; prefira `debugPrint` ou remova logs temporários.

## Effective Dart (resumo aplicado)

- Use `dart format` e mantenha consistência de estilo/nomenclatura.
- Prefira `final` para valores imutáveis locais e campos sem reatribuição.
- Prefira `async/await` a encadeamentos complexos de `Future`.
- Prefira interpolação de string em vez de concatenação manual.
- Evite `dynamic` quando um tipo explícito ou inferível for suficiente.
- Em APIs públicas, prefira doc comments `///` curtas e objetivas.

## Referências oficiais (link, não cópia)

- Effective Dart: https://dart.dev/effective-dart
- Flutter architecture recommendations:
  https://docs.flutter.dev/app-architecture/guide
