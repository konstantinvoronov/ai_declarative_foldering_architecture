# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/use_cases`

## SRP

Contains contracts for business operations that coordinate multiple repositories or multiple repository operations. Concrete implementations live in this feature's `infrastructure/use_cases` folder.

## Allowed Direct Children

- none

## Allowed Files

- `i_*_use_case.dart`

## Naming

- Files: `i_<name>_use_case.dart`
- Interfaces: `I<Name>UseCase`

## Blueprint Required

- no

## Public Entrypoints

- `i_*_use_case.dart`

## Forbidden

- concrete use-case implementations
- dependencies not allowed by the parent Domain rules
