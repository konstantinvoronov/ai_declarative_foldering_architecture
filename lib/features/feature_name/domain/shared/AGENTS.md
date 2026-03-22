# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/features/feature_name/domain/shared — It is wire only.

# Foldering structure and architecture limits and requirements and dependenscy

## 2. Reponsobilities for this folder

It is wire only, it contains pure export files that can be imported
from outside. this files are part of declarative approach that declares availability for public access.
files wired here ONLY when they are actually used some where. "no for future uses".

## 3. Rules Dependency limits:

- Can only depend on the this feature domain folders. All files must be located in related to the layer folder (same folder where original files lives)
- All files and subfolders can be accessible from apropriate layer from other features or from /core/managers and files from folders specifically
