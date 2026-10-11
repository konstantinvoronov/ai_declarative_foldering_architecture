# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/data`

## SRP

Defines external data contracts and their mapping boundary. Data owns DTOs, mappings between DTOs and Domain representations, and interfaces that isolate individual external data services. It contains no concrete service integrations and does not implement Domain repositories.

## Allowed Direct Children

- `dtos`
- `mappers`
- `data_sources`

## Allowed Files

- none

## Naming

- Folders: `snake_case`
- Files and declarations follow the rules in the applicable child folder.

## Blueprint Required

- yes: every direct child must use the matching folder and `AGENTS.md` from this feature blueprint

## Public Entrypoints

- none

## May Import From

- this feature's `data/dtos`
- this feature's `data/mappers`
- this feature's `data/data_sources`
- this feature's `domain/entities`
- this feature's `domain/models`

Child-folder rules narrow these permissions further.

## May Be Imported By

- this feature's Infrastructure layer
