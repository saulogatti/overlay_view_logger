---
description: "Use quando escrever, corrigir ou refatorar testes Flutter/Dart neste repositório; cobre estrutura de main(), asserts, escopo de teste e validação com flutter test."
name: "Test Guidelines"
applyTo: "test/**/*.dart, **/*_test.dart"
---

# Test Guidelines

- Sempre inclua `main()` válido em arquivos de teste; não deixe placeholders comentados.
- Prefira organizar por `group()` e nomes descritivos de cenários.
- Em testes de sucesso/erro de repositório, valide o contrato `Result<Success, ErrorObj>` usando `fold()`.
- Para estado, verifique transições esperadas de `OverlayBlocState` (`initial`, `loading`, `success`, `error`) com asserts explícitos.
- Use imports relativos quando houver alternativa dentro do workspace (alinhado com `prefer_relative_imports`).
- Não edite arquivos gerados (`*.g.dart`, `*.freezed.dart`) para “consertar” testes; altere a fonte e regenere.

## Qualidade e escopo

- Escreva testes pequenos e focados (um comportamento por teste).
- Evite acoplamento com UI completa quando o alvo for regra de negócio; priorize unidade de `core/domain/data`.
- Para widgets, valide comportamento observável (texto, ação, navegação), não detalhes de implementação interna.

## Validação

- Execute `flutter analyze` ao finalizar alterações relevantes em código de produção.
- Execute `flutter test` para validar os cenários adicionados/alterados.
- Quando possível, rode testes por arquivo durante iteração e suíte completa antes de concluir.