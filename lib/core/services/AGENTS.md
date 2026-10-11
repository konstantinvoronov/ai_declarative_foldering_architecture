# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/core/services`

## SRP

Contains app-wide, feature-independent Services that work directly with device-dependent capabilities such as haptics, compass, and camera.

A `Service` exposes a device capability as device-level values, events, or operations.

`Service` has the same meaning in `/lib/libs/<library_name>/core/services`, where the library's cumulative rules apply.

## Allowed Direct Children

- none

## Allowed Files

- `*_service.dart`

## Naming

- Folders: none
- Files: `<capability>_service.dart`
- Classes: `<Capability>Service`

## Blueprint Required

- no

## Public Entrypoints

- `*_service.dart`

## May Import From

- `dart:*`
- Flutter SDK APIs that expose platform, lifecycle, or device capabilities
- third-party packages that directly expose platform, operating-system, or device capabilities
- files in `/lib/core/services`

## May Be Imported By

- `/lib/app`
- `/lib/core`
- `/lib/shared`
- `/lib/features/*/presentation/controllers`
- `/lib/features/*/presentation/presenters`
- `/lib/features/*/infrastructure`
- `/lib/core/managers`
- `/lib/core/flows`

## Forbidden

- none beyond cumulative parent rules and the allow-lists above
