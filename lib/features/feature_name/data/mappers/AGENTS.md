# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/data/mappers`

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

- /lib/features/feature_name/data/dtos
- /lib/features/feature_name/domain/entities
- /lib/features/feature_name/domain/models

## May Be Imported By

- /lib/features/feature_name/infrastructure/*

