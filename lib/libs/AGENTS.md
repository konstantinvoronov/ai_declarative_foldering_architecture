# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/libs`

## SRP

Contains reusable multi-project source that is maintained independently from this application. Project-specific changes are implemented in `/lib/shared`.

## Allowed Direct Children

- `<library_name>`

## Allowed Files

- none

## Naming

- Folders: `snake_case`

## Blueprint Required

- no

## Public Entrypoints

- entrypoints declared by each library

## May Import From

- `/lib/libs`

## May Be Imported By

- project folders permitted by their applicable rules

## Forbidden

- modifying files inside `/lib/libs`
- project-specific dependencies
- project-specific adaptations
