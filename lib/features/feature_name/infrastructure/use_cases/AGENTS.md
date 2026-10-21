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

- none outside the feature

Concrete use cases may be imported only by this feature's private `infrastructure/di.dart` construction helper, not by other files merely sharing its folder.

## May Import From

- /lib/features/feature_name/domain/repositories
- /lib/features/feature_name/domain/validators
- /lib/features/feature_name/domain/entities
- /lib/features/feature_name/domain/models
- /lib/features/feature_name/domain/params

## May Be Imported By

- /lib/features/feature_name/infrastructure

## Forbidden

- Presentation or UI dependencies
- Controllers, widgets, routing, or navigation
- Data sources or concrete repository implementations
- operations that only forward one repository call
