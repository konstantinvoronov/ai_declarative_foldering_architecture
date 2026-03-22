# AI Agents Guide (`AGENTS.md`)

This file defines how agents MUST work with this folder and its subfolder or other folders with this name in the project.

## Layer

/libs — External / Protected Code

## 1. Foldering structure and architecture limits and requirements and dependenscy

Only one folder for the project

## 2. Reponsobilities for this folder

Multi-project reusable code wich is not exaclty libraries but some code that has no
direct dependency on the project or current implementation, sub repositories included in multiple porjects/
Imported libraries / submodules / Stable base layer

## 3. Rules Dependency limits:

- READ-ONLY this code is open for extansion but closed for modification, if you ever need to modify code from here you put it in shared 
- Again, No modification without explicit permission
- Cannot depend on ANY other folder, May depend on toher code within libs forlder
- Can be used by folder within appropiate layers 

