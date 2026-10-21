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

Consumers of these wiring-only entrypoints are limited to other features' Infrastructure layers. The `/lib/features/*` directory ceiling is not blanket access for other layers or feature internals.

## May Import From

- /lib/features/feature_name/infrastructure/*

## May Be Imported By

- /lib/features/*

## Preferred Coordination

- Prefer a Core Manager when a workflow coordinates two or more features.
- Use this export boundary when another feature's Infrastructure layer has a justified direct dependency on a deliberately exported Infrastructure capability.

## Forbidden

- implementation code
