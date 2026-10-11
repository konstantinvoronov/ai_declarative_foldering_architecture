# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/app`

## SRP

Owns app initialization, dependency injection, routing, app-wide configuration, session bootstrap, localization initialization, and initial-shell setup. `di.dart` is global DI wiring that imports and calls feature DI registration functions. `routing.dart` is global routing wiring that imports and calls feature route builders.

## Allowed Direct Children

- none

## Allowed Files

- `app.dart`
- `bootstrap.dart`
- `di.dart`
- `routing.dart`
- `localization.dart`

## Naming

- Files: the exact filenames listed above
- Classes: `PascalCase`

## Blueprint Required

- no

## Public Entrypoints

- all files allowed in `/lib/app`

## May Import From

- each feature's public root `di.dart` and `presentation/routing.dart` entrypoints
- feature files only through those public DI and routing entrypoints, never feature screens, repositories, Controllers, or other internal files
- public Domain contracts required for wiring
- public entrypoints from `/lib/core`
- public entrypoints from `/lib/shared`
- public entrypoints from `/lib/libs`

## May Be Imported By

- `/lib/main.dart`
- `/lib/features`, as narrowed by each feature's descendant rules
- `/lib/core/flows`, through `routing.dart` only

## Forbidden

- business and Domain implementations
