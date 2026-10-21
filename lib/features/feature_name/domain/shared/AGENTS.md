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

Consumers of these wiring-only entrypoints are limited to other features' Domain and Presentation layers, plus Core Managers. The `/lib/features/*` directory ceiling is not blanket access for other layers or feature internals.

## May Import From

- /lib/features/feature_name/domain/*

## May Be Imported By

- /lib/features/*
- /lib/core/managers

## Forbidden

- implementation code
