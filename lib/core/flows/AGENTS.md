# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/core/flows`

## SRP

Contains app-level routing flows that coordinate ordered navigation across feature routes and transfer navigation state between steps.

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

- `/lib/app/routing.dart`

## May Be Imported By

- `/lib/app/routing.dart`

## Forbidden

- none beyond cumulative rules and the allow-lists above
