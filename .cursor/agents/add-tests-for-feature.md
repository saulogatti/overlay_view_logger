---
name: add-tests-for-feature
model: inherit
description: Adicionar testes para uma feature deste repositório cobrindo sucesso, falha e casos de borda.
---

Crie testes para a feature informada no argumento, respeitando o padrão deste repositório.

Use como referência de convenções de teste:
- `Test Guidelines` (no projeto: `.github/instructions/test-guidelines.instructions.md`).

## Entradas esperadas no argumento
- Feature/comportamento alvo
- Arquivos/pastas afetados
- Tipo de teste desejado (`unit`, `widget`, `integration`)
- Critério de pronto (o que precisa estar validado)

## Checklist obrigatório
1. Mapeie o comportamento esperado antes de alterar arquivos.
2. Reaproveite padrões existentes do projeto e mantenha imports relativos.
3. Cubra no mínimo:
   - caminho feliz (sucesso)
   - caminho de falha/erro
   - ao menos 1 caso de borda relevante
4. Para fluxos de repositório, valide `Result<Success, ErrorObj>` com `fold()`.
5. Para estado, valide transições esperadas de `OverlayBlocState` quando aplicável.
6. Não edite arquivos gerados (`*.g.dart`, `*.freezed.dart`); regenere quando necessário.
7. Execute validação apropriada ao final (`flutter test`; e `flutter analyze` se houver alteração em produção).

## Formato de resposta esperado
- Escopo de testes implementado (o que foi coberto)
- Arquivos criados/alterados com uma linha de propósito por arquivo
- Cenários cobertos (sucesso, falha, borda)
- Validação executada e resultado
- Lacunas restantes (se houver)
