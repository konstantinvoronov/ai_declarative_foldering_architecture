# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/validators`

## SRP

Contains concrete, stateless validation operations and pure abstract Validator bases. A concrete Validator receives an input value, applies a pure validation rule, and returns its result without using external state or services. An abstract base defines the validation contract with the same purity boundary.

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

Core Managers access this feature's declarations through `domain/shared` only; this list does not make internal files directly available across that boundary.

## May Import From

- Dart standard library
- `/lib/core/domain`

## May Be Imported By

- /lib/features/feature_name/domain/*
- /lib/features/feature_name/infrastructure/*
- /lib/features/feature_name/presentation/controllers
- /lib/core/managers

## Forbidden

- dependencies beyond the Dart standard library and `/lib/core/domain`
- mutable state, I/O, and service access
