# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/core/flows/ — Contains cross feature ui-logic that dependend on multiple fetures,

# 1. Foldering structure and architecture limits and requirements and dependenscy

Only one folder for the project

## 2. Reponsobilities for this folder

Contains cross feature ui-logic that dependend on multiple fetures coordinatin mid pages solutions and routing and transfer
state between screens and bottomsheets.

## 3. Rules Dependency limits:

- Can depend on: multiple features,core, shared,libs
- Nothing can be depended on anything from shared,
- Contains only business/domain logic
- Cannot contain presentation layer
- Contains routing file that should be wired to global routing
- Can be accessed through global routings
