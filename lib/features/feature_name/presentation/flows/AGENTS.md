# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/presentation/flows`

## SRP

Contains navigation flows that coordinate ordered navigation inside this Feature.

## Allowed Direct Children

- none

## Allowed Files

- `*_flow.dart`
- `routing.dart`

## Naming

- Files: `<name>_flow.dart`
- Classes: `<Name>Flow`
- Routing entrypoint: `routing.dart`

## Blueprint Required

- no

## Public Entrypoints

- `routing.dart`

## May Import From

- /lib/core/*
- /lib/features/feature_name/presentation/*

## May Be Imported By

- /lib/features/feature_name/presentation/*

## Forbidden

- dependencies outside `/lib/core` and this Feature's Presentation layer
