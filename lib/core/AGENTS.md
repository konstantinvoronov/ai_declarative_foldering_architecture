# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/core — App-Level Global logic lives—like your UI kit extensions, shared services, and any utilities that are global and not specific to this particular app.
App-specific, but feature-independent,

## 1. Foldering structure and architecture limits and requirements and dependenscy

Only one folder for the project

## 2. Reponsobilities for this folder

Global services (auth, session, config)
Builders, helpers
Extensions over /shared

## 3. Rules Dependency limits:

- Can depend on: shared
- Cannot depend on: features
- Must NOT contain business/domain logic
- Accessible from anywhere
