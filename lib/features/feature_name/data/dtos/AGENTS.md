# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/data/dtos`

## SRP

Contains short-lived representations of external transport or persistence contracts. DTOs describe data crossing an external boundary and contain no business behavior.

## Allowed Direct Children

- none

## Allowed Files

- `*_dto.dart`
- generated files belonging to an allowed DTO

## Naming

- Files: `<name>_dto.dart`
- Classes: `<Name>DTO`
- One DTO declaration per source file.

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- DTOs from this folder
- serialization libraries required by the external contract

## May Be Imported By

- /lib/features/feature_name/data/mappers
- /lib/features/feature_name/data/data_sources
- /lib/features/feature_name/infrastructure/*

