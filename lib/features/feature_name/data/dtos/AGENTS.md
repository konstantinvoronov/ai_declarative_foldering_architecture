# AI Agents Guide (`AGENTS.md`)

## Folder

`/features/feature_name/data/dtos`

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

- this feature's `data/mappers`
- this feature's `data/data_sources`
- this feature's Infrastructure layer

