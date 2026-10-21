# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/repositories`

## SRP

Defines the feature's public repository contracts as pure Domain interfaces. Implementations live in this feature's `infrastructure/repositories` folder.

## Allowed Direct Children

- none

## Allowed Files

- `i_*_repository.dart`

## Naming

- Files: `i_<name>_repository.dart`
- Interfaces: `I<Name>Repository`

## Blueprint Required

- no

## Public Entrypoints

- `i_*_repository.dart`

## Forbidden

- none beyond cumulative rules and the allow-lists above
