# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/infrastructure/use_cases`

## SRP

Contains strictly business-logic implementations of this feature's Domain use-case contracts. A Use Case coordinates multiple repositories or multiple repository operations through Domain contracts.

## Allowed Direct Children

- none

## Allowed Files

- `*_use_case.dart`
- `*_use_case_impl.dart`

## Naming

- Files: `<name>_use_case.dart` or `<name>_use_case_impl.dart`
- Classes: `<Name>UseCase` or `<Name>UseCaseImpl`
- Implemented interfaces: `I<Name>UseCase`

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- this feature's Domain repository contracts
- this feature's Domain validator contracts
- this feature's Domain entities, models, and params

## May Be Imported By

- this feature's `infrastructure/di.dart`

## Forbidden

- Presentation or UI dependencies
- Controllers, widgets, routing, or navigation
- Data sources or concrete repository implementations
- operations that only forward one repository call
