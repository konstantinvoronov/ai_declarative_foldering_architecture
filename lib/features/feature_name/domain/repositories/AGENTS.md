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

## May Import From

- declarations inside this feature's Domain layer
- public Domain declarations from other features through their `domain/shared` entrypoints

## May Be Imported By

- this feature's `domain/use_cases`
- this feature's `presentation/controllers`
- this feature's `infrastructure/repositories`
- this feature's `infrastructure/di.dart`
- `/lib/core/managers`

## Forbidden

- none beyond cumulative rules and the allow-lists above
