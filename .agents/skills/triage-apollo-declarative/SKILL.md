---
name: triage-apollo-declarative
description: Connect a requested development change to an existing or new tracked issue or milestone before implementation, then enrich its context using the existing development skills.
---

# Triage Apollo Declarative

Read the active project's setup record and [project management conventions](../../../ai_development/project_management.md). Use the selected system and its terminology.

Resolve the request against the active ticket and relevant existing items. Reuse a matching item and established context. For untracked work, propose a concise issue with its intended outcome and acceptance criteria; create it when the request or developer authorizes creation. Broader goals call for a milestone or equivalent grouping and the local `decompose-project-apollo-declarative` skill when proposing or after creating that grouping.

After the ticket is established, enrich its context using the existing development workflow. Consult relevant retained ticket records first, use `task-decomposer` in planning mode, and use its `discover-related-tickets` handoff for requested related-item discovery. Use `context-checker` for the resulting plan under the project's planning rules. Reuse current valid results under the ticket record contract.

Retain accepted scope and relevant evidence under the tracked item and apply authorized ticket updates. Rename the current chat after the finalized item title and maintain its state prefix under the shared conventions. Continue the authorized development workflow with that ticket and context.
