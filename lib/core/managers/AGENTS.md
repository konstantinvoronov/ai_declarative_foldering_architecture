# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/core/managers`

## SRP

Contains app-level Managers that coordinate multiple features through their public Domain contracts. Managers own cross-feature business coordination while features remain unaware of each other.

## Allowed Direct Children

- none

## Allowed Files

- `*_manager.dart`

## Naming

- Files: `<name>_manager.dart`
- Classes: `<Name>Manager`

## Blueprint Required

- no

## Public Entrypoints

- `*_manager.dart`

## May Import From

- public Domain contracts from multiple features
- `/lib/core`
- `/lib/shared`
- `/lib/libs`

## May Be Imported By

- `/lib/app`
- `/lib/core/flows`
- feature Presentation controllers that initiate cross-feature coordination

## Forbidden

- presentation implementations
- direct feature implementation imports
