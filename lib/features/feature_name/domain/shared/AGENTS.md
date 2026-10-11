# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/domain/shared`

## SRP

Contains wiring-only exports of this feature's Domain files that are intentionally available to other features or Core Managers. Domain implementations remain in their normal Domain folders.

## Allowed Direct Children

- none

## Allowed Files

- `*.dart`

## Naming

- Files: `snake_case`

## Blueprint Required

- no

## Public Entrypoints

- `*.dart`

## May Import From

- this feature's Domain layer

## May Be Imported By

- other features' Domain layers
- other features' Presentation layers
- `/lib/core/managers`

## Forbidden

- implementation code
