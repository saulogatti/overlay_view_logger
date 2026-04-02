# Project Guidelines

## Code Style
- Siga as regras de `analysis_options.yaml` (inclui `flutter_lints` com checagens estritas).
- Use imports relativos preferencialmente (`prefer_relative_imports` está como erro).
- Evite editar arquivos gerados (`*.g.dart`, `*.freezed.dart`); regenere com build runner.
- Prefira mudanças pequenas e localizadas, preservando a estrutura atual de camadas.

## Architecture
- Projeto Flutter organizado em camadas dentro de `lib/src/`:
  - `core/`: tipos compartilhados, erros e `Result`.
  - `domain/`: entidades e contratos de repositório.
  - `data/`: models, datasources (memória/json), manager e implementação de repositório.
  - `view/`: UI, widgets e estado via BLoC/Cubit.
- Fluxo principal: `view` -> `domain/repositories` -> `data/repositories` -> `data/manager` -> `data/datasource`.
- API pública principal do pacote: `lib/overlay_register.dart`.

## Build and Test
- Instalar dependências: `flutter pub get`
- Verificar lint/análise: `flutter analyze`
- Executar testes: `flutter test`
- Regenerar código (`freezed`/`json_serializable`):
  - `dart run build_runner build --delete-conflicting-outputs`

## Conventions
- Estados assíncronos usam `OverlayBloc` + `OverlayBlocState` (freezed unions).
- Repositórios retornam `Result<Success, ErrorObj>` em vez de lançar erro para a camada de view.
- Persistência é intercambiável por `RegisterDataSourceProvider`; implementação padrão atual usa memória (`MemoryObjectDataSource`) em `RegisterRepositoryImpl`.
- Para navegação e exemplos básicos de uso do projeto, veja `README.md`.

## Known Pitfalls
- `flutter analyze` pode falhar por usos de `print` (lint `avoid_print`). Prefira `debugPrint` ou remova logs temporários.
- O arquivo `test/overlay_register_test.dart` está como placeholder comentado; `flutter test` falha enquanto não houver `main()` válido em testes.
