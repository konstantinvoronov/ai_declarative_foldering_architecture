# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/core/managers/ — Cross feature logic / app level coordination / contains managers. This is a place from where you can access multiple features,

## 1. Foldering structure and architecture limits and requirements and dependenscy

Only one folder for the project

## 2. Reponsobilities for this folder

Contain managers - singltons or repositories that handles app levelol cross-feature orchastration

## 3. Rules Dependency limits:

- Can depend on: multiple features,core, shared,libs
- Nothing can be depended on anything from shared,
- Contains only business/domain logic
- Cannot contain presentation layer
