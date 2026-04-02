---
description: "Refatoração Flutter com checklist: define estratégia conservadora/agressiva, aplica mudanças incrementais e valida com analyze"
name: "Refactor Checklist"
argument-hint: "Escopo da refatoração, arquivos-alvo, critério de pronto e se deve rodar testes"
agent: "Flutter Refactor"
---
Execute uma refatoração Flutter guiada por checklist no escopo informado pelo usuário.

Entradas esperadas no argumento:
- Objetivo da refatoração
- Arquivos ou pasta alvo
- Critério de pronto
- Se deve executar `flutter test` (sim/não)

Checklist obrigatório:
1. Pergunte no início se a estratégia será **conservadora** ou **agressiva**.
2. Delimite escopo e risco antes de editar.
3. Faça mudanças pequenas e coesas, sem alterar comportamento não solicitado.
4. Evite duplicação e prefira extração de componentes/funções reutilizáveis.
5. Preserve arquitetura em camadas (`core/domain/data/view`) e contratos públicos.
6. Não edite arquivos gerados (`*.g.dart`, `*.freezed.dart`) manualmente.
7. Rode `flutter analyze` ao final.
8. Rode `flutter test` apenas se solicitado no argumento.

Formato de resposta esperado:
- Estratégia escolhida (conservadora/agressiva) e justificativa curta.
- Arquivos alterados com uma linha de propósito por arquivo.
- Riscos/impactos.
- Validação executada:
  - `flutter analyze`: resultado
  - `flutter test`: executado ou não executado (conforme pedido)
- Próximo passo recomendado (opcional e curto).