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

## May Import From

- Dart standard library
- `/lib/core/abstractions`

## May Be Imported By

- this feature's Domain layer
- this feature's Infrastructure layer
- this feature's Presentation layer
- `/lib/core/managers`, through this feature's `domain/shared`

## Forbidden

- dependencies beyond the Dart standard library and `/lib/core/abstractions`
- mutable state, I/O, and service access
