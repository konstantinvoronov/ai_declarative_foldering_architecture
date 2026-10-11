# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/core`

## SRP

Contains app-wide, feature-independent foundations. App-wide contracts live in `/lib/core/abstractions`, device-dependent capabilities live in `/lib/core/services`, cross-feature app-level coordination lives in `/lib/core/managers`, and cross-feature UI coordination lives in `/lib/core/flows`.

## Allowed Direct Children

- `abstractions`
- `services`
- `managers`
- `flows`

## Allowed Files

- none

## Naming

- Folders: `snake_case`
- Files and declarations follow the applicable child-folder rules.

## Blueprint Required

- no

## Public Entrypoints

- public files explicitly allowed by the applicable child-folder rules

## May Import From

- `/lib/shared`
- `/lib/libs`
- files in `/lib/core` allowed by the applicable child-folder rules
- public Domain contracts from multiple features, only from `/lib/core/managers`
- device APIs and packages allowed by `/lib/core/services/AGENTS.md`, only from `/lib/core/services`

## May Be Imported By

- any project folder whose applicable rules allow the specific Core entrypoint

## Forbidden

- feature-specific implementations outside `/lib/core/managers`
- presentation implementations outside `/lib/core/flows`
