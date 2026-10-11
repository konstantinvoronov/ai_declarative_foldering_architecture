# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain`

## SRP

Contains this feature's Domain declarations, structures, and pure rules. Repository and use-case contracts live in their matching Domain folders, while Validators and Formatters are concrete, stateless Domain operations.

## Allowed Direct Children

- `entities`
- `formatters`
- `interfaces`
- `models`
- `params`
- `repositories`
- `shared`
- `use_cases`
- `validators`

## Allowed Files

- none

## Naming

- Folders: `snake_case`

## Blueprint Required

- yes: every direct child must use the matching folder and `AGENTS.md` from this feature blueprint

## Public Entrypoints

- entrypoints declared by child-folder rules

## May Import From

- this feature's Domain layer
- other features' Domain declarations through their `domain/shared` entrypoints

## May Be Imported By

- this feature's Data layer, as allowed by applicable child-folder rules
- this feature's Infrastructure layer
- this feature's Presentation layer, as allowed by applicable child-folder rules
- other features and `/lib/core/managers`, through `domain/shared`

## Forbidden

- concrete repository implementations
- concrete use-case implementations
- DTOs
- framework code
- Data, Infrastructure, or Presentation dependencies
