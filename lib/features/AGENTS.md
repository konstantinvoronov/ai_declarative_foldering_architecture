# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features`

## SRP

Contains app-specific functionality as independent, isolated features. Cross-feature communication and coordination is performed by `/lib/core/managers`.

## Allowed Direct Children

- `<feature_name>`

## Allowed Files

- none

## Naming

- Folders: `snake_case`
- Each folder name describes one app feature.

## Blueprint Required

- yes: use `/lib/features/feature_name` according to the blueprint definition in `/lib/AGENTS.md`

## Public Entrypoints

- entrypoints explicitly allowed by the feature blueprint

## May Import From

- `/lib/app`
- `/lib/core` entrypoints allowed by the applicable feature-layer rules
- `/lib/shared`
- `/lib/libs`
- files inside the same feature allowed by its layer rules
- Cross-feature imports may use only `shared` entrypoints explicitly allowed by the importing layer. Files not exported through an allowed `shared` entrypoint remain internal to their feature.

## May Be Imported By

- `/lib/app` through public DI and routing entrypoints
- `/lib/core/managers` through public Domain contracts

## Forbidden

- direct imports from sibling features
- cross-feature repository access
