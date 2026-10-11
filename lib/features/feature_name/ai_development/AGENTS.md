# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/ai_development`

## SRP

This folder is designed not as a part of the code, but as a part of the developing-agent infrastructure. It contains the feature specification; the feature implementation plan while the feature is not completely implemented; all feature-specific documentation, including the entire conversation with the developer; and the diagnostic log specification containing instructions for an AI agent to go through the logs, identify corner cases, and verify that the feature works correctly.

## Allowed Direct Children

- none

## Allowed Files

- `feature_spec.md`
- `implementation_plan.md`
- `development_history.md`
- `<feature_name>_logs_test_spec.md`
- additional feature-specific documentation in `snake_case.md`

## Naming

- Documentation files: `snake_case.md`
- Diagnostic log specification: `<feature_name>_logs_test_spec.md`

## Blueprint Required

- yes: create this folder and its `AGENTS.md` for every feature

## Document Responsibilities

- `feature_spec.md`: the current feature behavior, requirements, acceptance criteria, and supported corner cases
- `implementation_plan.md`: the remaining implementation plan while the feature is not completely implemented
- `development_history.md`: the complete feature-specific developer conversation, decisions, clarifications, and implementation history
- `<feature_name>_logs_test_spec.md`: instructions for an AI agent to inspect diagnostic logs, check expected behavior and corner cases, and determine whether the feature works correctly

## Public Entrypoints

- none

## May Import From

- none

## May Be Imported By

- none

## Forbidden

- production source code
