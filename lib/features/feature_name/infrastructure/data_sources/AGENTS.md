# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/infrastructure/data_sources`

## SRP

Contains concrete implementations of this feature's Data Source interfaces. Each implementation connects one declared remote, local, or cache boundary to its real API handle, database, storage mechanism, or external client. A concrete Data Source returns the DTO or generated external representation declared by its matching Data Source interface. Conversion into Domain entities or Domain models is performed by Data mappers and coordinated by Infrastructure repositories.

## Allowed Direct Children

- none

## Allowed Files

- `*_data_source.dart`

## Naming

- Files: `<name>_data_source.dart`
- Classes: `<Name>DataSource`
- Implemented interfaces: `I<Name>DataSource`

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- this feature's `data/data_sources`
- this feature's `data/dtos`
- `/lib/app`
- `/lib/core`, except `/lib/core/managers` and `/lib/core/flows`

## May Be Imported By

- this feature's `infrastructure/di.dart`

## Forbidden

- none beyond cumulative rules and the allow-lists above
