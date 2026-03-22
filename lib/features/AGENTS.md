# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/features — Core App Logic
when you create in new folder in /features code agent must check the blue pring /features/feature_name/ and follow all rules
described there and referance it in all modifications inside other subfolders.

# Foldering structure and architecture limits and requirements and dependenscy

Only one folder for the project.

## 2. Reponsobilities for this folder

Contain ALL app-specific functionality. Each folder a future name. In each folders leave independed isolated different features
inside lives fully modular feature-based structure

## 3. Rules Dependency limits:

- Can depend on: common, shared, orchestration
- MUST NOT depend directly on other features
- No cross-feature repository access