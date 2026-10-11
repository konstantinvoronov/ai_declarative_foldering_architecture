# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/features/feature_name/presentation`

## SRP

Contains this feature's user interface and Presentation coordination.

## Allowed Direct Children

- `controllers`
- `flows`
- `shared`

## Allowed Files

- `di.dart`: optional private helper for Presentation registrations
- `routing.dart`
- `*_screen.dart`
- `*_sheet.dart`
- `*_widget.dart`

## Naming

- Files: `snake_case`
- Screens: `<name>_screen.dart`
- Sheets: `<name>_sheet.dart`
- Widgets: `<name>_widget.dart`

## Blueprint Required

- yes: every direct child must use the matching folder and `AGENTS.md` from this feature blueprint

## Public Entrypoints

- `routing.dart`: feature-local routing wiring. It defines route-builder functions that global App routing imports and explicitly calls. It imports this feature's screens, sheets, and route parameters internally.
- `shared/*`

## May Import From

- this feature's `domain/entities`
- this feature's `domain/models`
- this feature's `presentation/controllers`
- this feature's `presentation/flows`
- other features' `domain/shared`
- other features' `presentation/shared`
- `/lib/shared`
- `/lib/libs`

## May Be Imported By

- this feature's root `di.dart`, through the optional private `di.dart` helper
- `/lib/app`, through `routing.dart`
- this feature's `presentation/flows`
- other features' Presentation layers, through `shared/*`

## Forbidden

- none beyond cumulative rules and the allow-lists above
