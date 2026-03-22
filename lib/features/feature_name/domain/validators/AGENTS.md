# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/features/feature_name/validators — Data validity.

# Foldering structure and architecture limits and requirements and dependenscy


## 2. Reponsobilities for this folder

Validate each field, or entire entity. 

## 3. Rules Dependency limits:

- Can not depend on anything except other features same domain lavel files specifically shared in domain/shared/layer/ folders
- All files and subfolders can be accessible only within the this feature. Exceptions are files in /core/managers and files from folders specifically
put in folder domain/shared/layer/* those are intentianally made available for others.
- MUST NOT depend directly on other features

- NO implementations
- NO DTOs 
- NO framework code
- NO data layer dependencies
- 
- Only:
interfaces
abstract classes
pure logic