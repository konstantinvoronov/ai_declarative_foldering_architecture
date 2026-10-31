---
name: task-decomposer
description: Decompose planned work or review a change set for excessive scope, optionally using related-ticket discovery and retained review context. Use during task planning, before finalization, or when the user asks whether work should be split.
---

# Task Decomposer

Keep application code and Git unchanged. Change-set audits are read-only; planning can retain ticket context and apply authorized tracker updates as described below. Recommend undoing or reorganizing work when useful, but never reset, revert, restore, uncommit, delete, stage, or commit anything without separate explicit authorization.

## Planning and related-ticket context

For task-start planning, use the active request, ticket, requirements, and constraints; no existing diff is required. Distinguish a planning proposal from a completed change-set audit. Read the active project's [ticket record contract](../../../ai_development/ticket_review_records.md) when working with ticket evidence.

Ask once during planning whether the developer wants to investigate connected tickets, issues, and milestones, unless that choice is already established. Continue independent planning while awaiting the answer; do not treat silence as approval to search. When requested, use the local `discover-related-tickets` skill and evaluate its returned evidence. Consult relevant retained review summaries, expanding only where needed. Do not turn this planning question into an interactive prerequisite for read-only finalization audits; those use available evidence and report material gaps.

Separate useful requirements, dependencies, and developer decisions from historical assumptions and unconfirmed search candidates. Consult the developer when a connection changes scope or conflicts with current requirements. Retain relevant context and decisions under the active issue, with links to related records rather than wholesale copies. Prepare a concise update to the active ticket with accepted connections and their relevance. Apply that update only when authorized by the task or developer; otherwise return the concrete proposed update. Discovery alone does not authorize tracker changes, issue creation, or implementation of related work. Preserve unrelated ticket content and avoid duplicate links.

## Select the change set

In change-set audit mode, inspect the commit, commit range, staged changes, or working-tree changes named by the caller. When no target is named, use the current job's changes established from the conversation and Git evidence. Separate unrelated pre-existing changes and report uncertainty. In planning mode, inventory the proposed outcomes and dependencies instead; absence of an implementation diff is expected.

## Inventory the scope

Identify:

- distinct repositories or projects;
- affected features;
- user-visible outcomes;
- independent architectural or behavioral concerns;
- migrations, refactors, generated output, tests, diagnostics, and documentation supporting each outcome;
- dependencies that determine the order of possible smaller tasks.

Do not judge scope by changed-line count alone. Keep implementation, tests, diagnostics, specification updates, and required documentation together when they verify one coherent outcome.

## Decide whether to decompose

Recommend decomposition when the change combines independently deliverable outcomes, unrelated features, multiple projects that can be completed separately, or a refactor that can be reviewed independently from behavior built on top of it.

Treat a cross-layer change as one task when every layer is required for one coherent feature outcome. Do not create artificial micro-commits that cannot be built, reviewed, or verified independently.

## Recommend the smaller tasks

When decomposition is appropriate:

1. State why the current change is too broad.
2. For existing implementation that needs reorganization, recommend preserving a recoverable snapshot.
3. Only when needed for existing implementation, suggest returning combined work to an editable state as a proposed action requiring developer approval. Skip recovery and reorganization steps for plans with no implementation.
4. Define ordered smaller tasks, each with one outcome, affected project and feature, file scope, dependencies, acceptance criteria, verification, documentation, diagnostics, and intended commit boundary.
5. Identify files that must move together and files that can safely be separated.

When the change is already cohesive, say so and explain why a smaller split would reduce clarity or verifiability.

## Report

Return the mode and scope, number of projects, features, and independent outcomes found; the decomposition decision; the proposed ordered tasks when needed; and a final `PASS`, `SPLIT RECOMMENDED`, or `BLOCKED` result. In planning mode also identify relevant ticket connections, retained evidence, unresolved decisions, and any proposed or applied tracker update. Do not perform the proposed Git operations.
