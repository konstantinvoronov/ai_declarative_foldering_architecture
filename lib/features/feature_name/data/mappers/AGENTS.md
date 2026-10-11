# AI Agents Guide (`AGENTS.md`)

## Folder

`/features/feature_name/data/mappers`

## SRP

Contains explicit conversion between Data DTOs and Domain entities or Domain models. A mapper changes representation only; it does not retrieve data or make business decisions.

## Allowed Direct Children

- none

## Allowed Files

- `*_mapper.dart`

## Naming

- Files: `<source>_mapper.dart`
- Mapper declarations name the source representation or the conversion boundary.

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- this feature's `data/dtos`
- this feature's `domain/entities`
- this feature's `domain/models`

## May Be Imported By

- this feature's Infrastructure layer

