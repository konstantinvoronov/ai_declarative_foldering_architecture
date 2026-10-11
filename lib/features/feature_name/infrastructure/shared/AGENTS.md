# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/infrastructure/shared`

## SRP

Contains wiring-only exports of this feature's Infrastructure files that are deliberately available to other features' Infrastructure layers. Infrastructure implementations remain in their normal Infrastructure folders.

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

- this feature's Infrastructure layer

## May Be Imported By

- other features' Infrastructure layers

## Preferred Coordination

- Prefer a Core Manager when a workflow coordinates two or more features.
- Use this export boundary when another feature's Infrastructure layer has a justified direct dependency on a deliberately exported Infrastructure capability.

## Forbidden

- implementation code
