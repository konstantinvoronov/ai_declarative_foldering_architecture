# AI Agents Guide (`AGENTS.md`)

This file defines how agents must work with repository. It only cover certain places we manage to get hands on

Main rule - keep it simple, always try to find simple, streamlined, easy to digest solution
that will do the job. no overengenering, optional things or extra cautios.


# Foldering architecture

In this project very important for coding agent to position files in correct folder. Each folder has
its own Agents.md files defining purpose of the folder, what subfolders alowed in it, what is resposobilite
of the files stored in the folders, what those files are allowed to be depended on , and what is allowed to include.

Dependencie rules estimated ralatebly to import and export syntact form the files inside folders.

To enforce declared architecture structure every time you finish implementing something new you must
run linter screen that will check how good you are doing and request changes if you broke the rules.

## Layering

Inside the prjoect used modification of CLEAN architecture layering along with feature drived development approach
and with specific extra folders.
explaining foldering dependenciries basing on the recursive base (each subfolder must add rules to all folders alogn the path)
or by name of the layer cross folders - layreing limits. those are described down

## Global Layreing limits Dependency rules.

In some folders in AGENTS.md files may be relus set as correstpondent layer. and we have 4 different layers and one modificator
modificator (a subfolder name inside layer folder)

- shared  - its a folder that can meet across folders and (ecvept /shared) all the shared folders is a wiring folders. thay contain export files declaring what from the folder is allowed to include cross feature

Layers (can meat across porject presented as folder names)

- Domain
- Data
- Infrastructure
- Presentation

They have very specific add on to dependencies writen in AGENTS.md files in ralated folders.

Domain fodler from features can not be dependent on anything else but itself (other files form the folder) or others Domain/shared (form other features)

Data folder allowed be dependednt on it's own feature/domain layer or other files from same data layer 
or others features Domain/shared

Inrustructure - Layer that can depend only on domain,data layers from its feature or on what the domain and data allow to depend
and globaly on /shared, /app , /core (except /core/managers,/core/flows,)

Presentation  - screens and bottomsheets depends only on designated controllers and controllers may depend only on the repositories or use_cases from domain folder
or if in the file imported anything from /core/managers then only meneger dependent allow.


## Logging Foldering structure and architecture

foldering is important - it defines scope, responsobilites and give instructions,
read agents file in root folder and in every folder you work with.

store and update files accord ing to instructions.

lib/ui/common/uikit/ - Place With new UIKit elements analogs of figma each one in a new folder
aka  lib/ui/common/uikit/element_name/
inside the folder
file element_name_spec.md that hace figma link inside and spec for ai agent
file element_name_plan.md file with current developing progress and developer corrections and code review and progress

## Developing principles

Ask many question during planning sessions
Minimal refactor,
No renaming,
No ai comments only /// docs for 1-2 lines top on public functions
Always generate separate file for separate layers.
Clean architecture structure with clear Responsobilities, Single source of truth
Widgets should be simple and follow generic flutter approach, instead of taking alot of params they take child widget unless it is a comlex widget

Declarative programing style:
bed: ifAbsent functions, ensurePresence or loadIfNeeded.
good: sealed state classes with exastive switch sysntacses, business logic separation from ui,

fail soon rule. dont do exastive checking on data validity, report fail instead of hiding

### Planing work

start working with estimating layers involved and folders need to do that always study /feature/feature_name/AGENTS.md
and other files inside project and use it as a responsobilities and architecture blue pring for creating and modificating folders.
store source task
define stages
estimate correctness and suggest spliting task
each task should containing planing/rewieving plan/implementing/reviewing/correting and you should always remind developer to do next stage
it may involve other stage

ask if we need to write test but never do it by default

