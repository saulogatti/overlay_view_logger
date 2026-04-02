# Project Guidelines

## Code Style
- Siga `analysis_options.yaml` (baseado em `flutter_lints` com checagens estritas).
- Use imports relativos (`prefer_relative_imports` é erro).
- Não edite arquivos gerados (`*.g.dart`, `*.freezed.dart`); regenere com build runner.
- Prefira mudanças pequenas e localizadas, preservando a estrutura em camadas.

## Architecture
- Projeto Flutter organizado em camadas dentro de `lib/src/`:
  - `core/`: tipos compartilhados, erros e `Result`.
  - `domain/`: entidades e contratos de repositório.
  - `data/`: models, datasources (memória/json), manager e implementação de repositório.
  - `view/`: UI, widgets e estado via BLoC/Cubit.
- Fluxo principal: `view` -> `domain/repositories` -> `data/repositories` -> `data/manager` -> `data/datasource`.
- API pública principal do pacote: `lib/overlay_register.dart`.
- Arquivos de referência de padrão:
  - `lib/src/core/result/result_obj.dart` (Result pattern)
  - `lib/src/view/controllers/overlay_bloc.dart` + `overlay_bloc_state.dart` (Cubit + freezed unions)
  - `lib/src/data/repositories/register_repository_impl.dart` (repositório com `Result`)

## Build and Test
- Instalar dependências: `flutter pub get`
- Verificar lint/análise: `flutter analyze`
- Executar testes: `flutter test`
- Regenerar código (`freezed`/`json_serializable`):
  - `dart run build_runner build --delete-conflicting-outputs`
- Referências adicionais:
  - Evolução de versão: `CHANGELOG.md`
  - API docs gerada: `docs/index.html`

## Conventions
- Estados assíncronos usam `OverlayBloc` + `OverlayBlocState` (freezed unions).
- Repositórios retornam `Result<Success, ErrorObj>` em vez de lançar erro para a camada de view.
- Persistência é intercambiável por `RegisterDataSourceProvider`; implementação padrão atual usa memória (`MemoryObjectDataSource`) em `RegisterRepositoryImpl`.
- Para exemplos de uso público, consulte `lib/overlay_register.dart`.

## Known Pitfalls
- `flutter analyze` pode falhar por usos de `print` (lint `avoid_print`). Prefira `debugPrint` ou remova logs temporários.
- `flutter analyze` falha com imports absolutos quando houver alternativa relativa (`prefer_relative_imports`).
- Ao alterar models/states com anotações (`@JsonSerializable`, `@freezed`), regenere arquivos via build runner.
- `test/overlay_register_test.dart` está como placeholder comentado; `flutter test` falha enquanto não houver `main()` válido em testes.
