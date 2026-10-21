# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/presentation/shared`

## SRP

Contains wiring-only exports of this feature's Presentation files that are intentionally reusable by other features' Presentation layers.

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

Consumers of these wiring-only entrypoints are limited to other features' Presentation layers. The `/lib/features/*` directory ceiling is not blanket access for other layers or feature internals.

## May Import From

- /lib/features/feature_name/presentation/*

## May Be Imported By

- /lib/features/*

## Forbidden

- implementation code
