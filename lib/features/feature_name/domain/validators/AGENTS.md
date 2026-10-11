# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/validators`

## SRP

Contains concrete, stateless validation operations. Each Validator receives an input value, applies a pure validation rule, and returns its result without using external state or services.

## Allowed Direct Children

- none

## Allowed Files

- `*_validator.dart`

## Naming

- Files: `<name>_validator.dart`
- Classes: `<Name>Validator`
- Operations: `validate`

## Blueprint Required

- no

## Public Entrypoints

- `*_validator.dart`

## May Import From

- Dart standard library
- `/lib/core/abstractions`

## May Be Imported By

- this feature's Domain layer
- this feature's Infrastructure layer
- this feature's `presentation/controllers`
- `/lib/core/managers`, through this feature's `domain/shared`

## Forbidden

- dependencies beyond the Dart standard library and `/lib/core/abstractions`
- mutable state, I/O, and service access
