# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/features/feature_name/infrastructure — Concrete implementations

# Foldering structure and architecture limits and requirements and dependenscy

## 1. Reponsobilities for this folder

- Implement domain contracts
- Execute real logic
- Integrate data layer

## 3. Rules Dependency limits:

- Can depend on: domain, data from this feature or app, shared, core 
- Can be accessed only from presentation layer of this feature or /core/managers 