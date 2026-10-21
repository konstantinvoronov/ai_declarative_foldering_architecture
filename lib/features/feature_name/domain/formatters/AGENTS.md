# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/formatters`

## SRP

Contains concrete, stateless text-formatting operations. Each Formatter receives an input value, applies a pure formatting rule, and returns its text representation without using external state or services.

## Allowed Direct Children

- none

## Allowed Files

- `*_formatter.dart`

## Naming

- Files: `<name>_formatter.dart`
- Classes: `<Name>Formatter`
- Operations: `format`

## Blueprint Required

- no

## Public Entrypoints

- `*_formatter.dart`

Core Managers access this feature's declarations through `domain/shared` only; this list does not make internal files directly available across that boundary.

## May Import From

- Dart standard library
- `/lib/core/domain`

## May Be Imported By

- /lib/features/feature_name/domain/*
- /lib/features/feature_name/infrastructure/*
- /lib/features/feature_name/presentation/*
- /lib/core/managers

## Forbidden

- dependencies beyond the Dart standard library and `/lib/core/domain`
- mutable state, I/O, and service access
