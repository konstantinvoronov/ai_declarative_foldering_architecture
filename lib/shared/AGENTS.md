# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/shared`

## SRP

Contains project-specific adaptations and extensions of reusable code from `/lib/libs`. Each adaptation retains the responsibility of the library layer it adapts.

## Allowed Direct Children

- `assets`
- `extensions`
- `mixins`
- `models`
- `presentation`
- `widgets`

## Allowed Files

- none

## Naming

- Folders: `snake_case`
- Files: `snake_case`

## Blueprint Required

- no

## Public Entrypoints

- files explicitly exposed by descendant folder rules

## May Import From

- `/lib/libs`
- `/lib/app`
- `/lib/core`

## May Be Imported By

- `/lib/app`
- `/lib/core`
- `/lib/features`

## Forbidden

- modifying or duplicating the original library implementation
- Domain logic
- code unrelated to adapting `/lib/libs`
