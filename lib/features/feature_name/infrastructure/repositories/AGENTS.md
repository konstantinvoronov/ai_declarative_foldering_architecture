# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/infrastructure/repositories`

## SRP

Contains concrete implementations of this feature's Domain repository contracts. Every repository implements its matching public interface from this feature's `domain/repositories` folder, calls Data Sources through interfaces from `data/data_sources`, and uses Data mappers to convert returned DTOs or generated external representations into Domain entities or Domain models.

## Allowed Direct Children

- none

## Allowed Files

- `*_repository.dart`

## Naming

- Files: `<name>_repository.dart`
- Classes: `<Name>Repository`
- Implemented interfaces: `I<Name>Repository`

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- this feature's Domain layer
- this feature's `data/data_sources`
- this feature's `data/dtos`
- this feature's `data/mappers`
- `/lib/app`
- `/lib/shared`
- `/lib/core`, except `/lib/core/managers` and `/lib/core/flows`
- `/lib/libs`

## May Be Imported By

- this feature's `infrastructure/di.dart`

## Forbidden

- direct imports of concrete `infrastructure/data_sources` implementations
