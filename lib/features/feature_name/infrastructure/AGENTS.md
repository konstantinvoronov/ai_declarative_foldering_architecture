# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/infrastructure`

## SRP

Contains concrete implementations of this feature's Domain contracts and integrates the feature's Data layer.

## Allowed Direct Children

- `data_sources`
- `extensions`
- `mixins`
- `repositories`
- `shared`
- `use_cases`

## Allowed Files

- `di.dart`: optional private helper that binds Data Source and Domain repository interfaces to their concrete Infrastructure implementations

## Naming

- Folders: `snake_case`
- Files and declarations follow the applicable child-folder rules.

## Blueprint Required

- yes: every direct child must use the matching folder and `AGENTS.md` from this feature blueprint

## Public Entrypoints

- `shared/*`

## May Import From

- this feature's Domain layer
- this feature's Data layer
- other features' deliberately exported Infrastructure capabilities through their `infrastructure/shared` entrypoints
- `/lib/app`
- `/lib/shared`
- `/lib/core`, except `/lib/core/managers` and `/lib/core/flows`
- `/lib/libs`

## May Be Imported By

- this feature's root `di.dart`, through the optional private `di.dart` helper
- this feature's `presentation/controllers`
- other features' Infrastructure layers, through this feature's `infrastructure/shared` entrypoints

## Forbidden

- none beyond cumulative rules and the allow-lists above
