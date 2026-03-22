# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/features/feature_name — This is a blue print for a feature it create structure and explain rule for a Feature

# Foldering structure and architecture limits and requirements and dependenscy

in /features can be as many features as required by the app. 

## 2. Reponsobilities for this folder

Contain ALL app-specific features specific functionality separated by specified layers architucture and following rule.

## 3. Rules Dependency limits:

- Can depend on: app, core, libs/ shared,
- MUST NOT depend directly on other features
- Cannot be accessed from any where in the project except from /core/managers/
- All data inside
  
- contain only folders iniside LAYER DEFINITIONS (STRICT)
