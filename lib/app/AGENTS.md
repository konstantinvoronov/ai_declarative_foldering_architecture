# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/app — Wiring & Configuration Layer

## 1. Foldering structure and architecture limits and requirements and dependenscy

Only one folder for the project

## 2. Reponsobilities for this folder

App initialization / Dependency Injection (DI) / Routing / Session/bootstrap logic

## 3. Rules Dependency limits:

- Can import only files: form  di, routing, domain (levels subfolders) from shared, features, orchestration project parts
- Files from /app folder cannot be imported to any part of the project  (Cannot be depended on by: anyone) Only exception is /main.dart.
- Contains NO business logic / except for initializeing di,routeing, sessions, internalization, initial shell and bootstap
