# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/core/abstractions`

## SRP

Contains app-wide, feature-independent abstraction declarations. These files define contracts that project layers may implement without providing concrete behavior.

## Allowed Direct Children

- none

## Allowed Files

- `*.dart`

## Naming

- Files: `snake_case`
- Declarations: named by responsibility
- Example: `resource_validator.dart` declares `ResourceValidator<T>`
- Example: `value_formatter.dart` declares `ValueFormatter<T>`
- Example: `use_case.dart` declares `UseCase<Input, Output>`
- Example: `navigation_flow.dart` declares `NavigationFlow<Result>`

## Blueprint Required

- no

## Public Entrypoints

- `*.dart`

## May Import From

- Dart standard library

## May Be Imported By

- `/lib/main.dart`
- `/lib/app`
- `/lib/core`
- `/lib/shared`
- `/lib/features`

## Forbidden

- concrete implementations
- dependencies beyond the Dart standard library
- imports from `/lib/libs`
