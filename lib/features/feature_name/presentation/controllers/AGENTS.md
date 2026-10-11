# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/presentation/controllers`

## SRP

Contains one Controller, Cubit, or Bloc for each screen. Controllers are the entrypoint for that screen's UI logic.

## Allowed Direct Children

- none

## Allowed Files

- `*_controller.dart`
- `*_cubit.dart`
- `*_bloc.dart`

## Naming

- Files: `<screen_name>_controller.dart`, `<screen_name>_cubit.dart`, or `<screen_name>_bloc.dart`
- Classes: `<ScreenName>Controller`, `<ScreenName>Cubit`, or `<ScreenName>Bloc`

## Blueprint Required

- no

## Public Entrypoints

- none

## May Import From

- files in this folder
- this feature's `domain/entities`
- this feature's `domain/models`
- this feature's `domain/repositories`
- this feature's `domain/use_cases`
- this feature's Infrastructure layer
- `/lib/core/managers`
- `/lib/shared`
- `/lib/libs`

## May Be Imported By

- this feature's Presentation layer

## Forbidden

- none beyond cumulative rules and the allow-lists above
