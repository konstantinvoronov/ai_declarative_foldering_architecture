# AI Agents Guide (`AGENTS.md`)

## Folder

`/lib/app`

## SRP

Owns app initialization, dependency injection, routing, app-wide configuration, session bootstrap, localization initialization, and initial-shell setup. `di.dart` owns the GetIt container and DI startup sequence; its project imports are restricted to `/lib/app/di`. That folder composes public feature and Core DI entrypoints. `routing.dart` is global routing wiring that imports and calls feature route builders.

Feature dependencies use only the public feature-root DI and Presentation routing entrypoints. Only `/lib/app/di/features_di.dart` imports feature DI. Other feature internals are not App dependencies. Core, Shared, and library dependencies use their permitted public entrypoints for wiring; `/lib/app/di.dart` retains its narrower helper-only project imports.

## Allowed Direct Children

- `di`: registration composition helpers governed by `di/AGENTS.md`

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

Within `/lib`, only `main.dart` is an external startup consumer; this does not expose App to arbitrary root files. Shared consumes App for project configuration/adaptation. Feature consumers still require their own layer permission. Core Flows consume only global `routing.dart`, not other App files.

## May Be Imported By

- /lib
- /lib/shared/*
- /lib/libs/*
- /lib/features/*
- /lib/core/flows

## Forbidden

- business and Domain implementations
