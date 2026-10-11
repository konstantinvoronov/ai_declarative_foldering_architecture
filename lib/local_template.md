## Folder
`/path/to/folder`

## SRP
One short paragraph.

## Allowed Direct Children
- `child_name`
- `child_name`
- none

## Allowed Files
- `special.dart`
- `*_pattern.dart`
- none

## Naming
- Folders: `snake_case`
- Files: `snake_case`
- Classes: `ExampleName`

## Blueprint Required
- yes: use `/path/to/blueprint`
or
- no

## Public Entrypoints
- `di.dart`
- `routing.dart`
- `shared/*`
- none

## May Import From
- `domain`
- `parent/shared`
- `core`
- `public entrypoint: routing.dart`

## May Be Imported By
- `main.dart`
- `app`
- `presentation`
- `core/managers`
- none

## Forbidden
- business logic
- direct imports from sibling features
- custom subfolders not listed above

## Allowed Direct Children 
any - folder name is name of the feature

## Allowed Files

di.dart, routing.dart, *_screen.dart, *_repository.dart