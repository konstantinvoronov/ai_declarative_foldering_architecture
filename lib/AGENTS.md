# AI Agents Guide (`AGENTS.md`)

This file defines how agents must work with repository. It only cover certain places we manage to get hands on

Main rule - keep it simple, always try to find simple, streamlined, easy to digest solution
that will do the job. no overengenering, optional things or extra cautios.


# Foldering architecture

In this project very important for coding agent to position files in correct folder. Each folder has
its own Agents.md files defining purpose of the folder, what subfolders alowed in it, what is resposobilite
of the files stored in the folders, what those files are allowed to be depended on , and what is allowed to include.


in this project we are treating the filesystem as the architecture contract for agents and developers,
not just as storage.

For each folder, the rule file should define:

The folder’s SRP: why this folder exists and what responsibility belongs here.
Allowed contents: which file types, classes, concepts, and subfolders may exist here.
Naming rules: how files/folders inside should be named.
Blueprint rules: whether creating a file or subfolder here must start from a required template.
Outbound dependencies: what files in this folder are allowed to import from.
Inbound visibility: what other folders are allowed to import or export this folder’s files.
Special cases: required entrypoints like di.dart, routing.dart, export-only folders, read-only folders, singleton folders, etc.
And yes, when you say dependency, you mean it literally at import/export level in both directions:
What code inside this folder may depend on.
What code outside this folder may depend on from this folder.

So the core idea is: each folder is a declarative policy boundary for agents. 
If we make the rules precise enough, an agent can decide where code belongs, 
what it may reference, and whether a new file/subfolder is legal before writing anything.

To enforce declared architecture structure every time you finish implementing something new you must
run linter screen that will check how good you are doing and request changes if you broke the rules.

## Global Layering limits Dependency rules.

Rule resolution in this project is path-based and cumulative. Every file and folder inside lib/ must follow all AGENTS.md files found on the path from lib/ to its own folder. Parent rules define global meanings and constraints. A child AGENTS.md defines the scope of its own folder and its descendants, and may only add, narrow, or clarify rules unless a parent rule explicitly allows override. Placement rules and dependency rules are separate: allowing imports from a layer, path, or public entrypoint does not allow creating such files everywhere. When a rule refers to a layer such as domain, data, infrastructure, presentation, it means any folder declared as that layer and all folders inside its subtree, unless a deeper AGENTS.md narrows that meaning.

A folder-level dependency permission defines only the maximum available dependency; it does not grant every descendant permission to import it. Deeper layer, folder, and file rules determine actual access. Feature screens, sheets, views, and widgets interact upward through their designated Controller. A Controller may import Domain repository interfaces, use cases, the same feature's Infrastructure layer, and explicit Core Managers allowed by its own rules. A Controller may not import another Controller.

`May Import From` and `May Be Imported By` are resolved independently. A local rule may add an explicit path or file exception to an ancestor dependency restriction for its own scope. The exception applies only to the named direction and exact path. An import is allowed only when the importer's `May Import From` and the imported target's `May Be Imported By` both permit it.

`/lib/libs/<library_name>/<root_folder>` is a library-scoped alias of `/lib/<root_folder>` for every architectural folder defined directly under `/lib`, except the `libs` container itself. Responsibilities, naming, allowed structure, and matching descendant rules from the canonical path apply to the same relative path inside the library. Project-wide or app-wide scope becomes library-wide scope. Cumulative `/lib/libs` and library-local rules remain active.

Inside a Feature, a folder named `shared` is a wiring-only public entrypoint. It contains export directives only and exposes files from its parent layer or descendants as permitted by local rules. This rule does not apply to the top-level `/lib/shared` architectural layer.

Folders inside the same feature may import internal feature paths when both applicable folder rules permit the relationship; a `shared` entrypoint is not required. Across features, imports may target only `shared` entrypoints explicitly allowed by the consumer's rules. Domain may import another feature's `domain/shared`. Presentation may import another feature's `domain/shared` or `presentation/shared`. Infrastructure may import another feature's `infrastructure/shared`. Core Managers may import `domain/shared` and may not import Presentation.

Prefer a Core Manager when a workflow coordinates two or more features. Use `infrastructure/shared` only when one feature's Infrastructure layer has a justified direct dependency on a deliberately exported Infrastructure capability from another feature. Every such dependency passes through `infrastructure/shared`; the remaining Infrastructure files stay internal.

wiring-only means the file exists only to connect, expose, register, or assemble other files. It may contain import/export directives and the minimum code necessary for that wiring purpose, but it must not contain business logic, domain logic, data processing logic, or reusable implementation that belongs in a normal source file.

Default policy is deny by default. If a file type, folder name, subfolder, import target, or public entrypoint is not explicitly allowed by the applicable rules, it is forbidden.

When no applicable rule provides the required placement or dependency, the agent MUST present the uncovered case and request a rule decision before writing code.

## Global vocabulary:

Folder anchors which scope the file governs.
SRP states the responsibility boundary.
Allowed Direct Children controls folder creation.
Allowed Files controls file creation.
Naming avoids agent improvisation.
Blueprint Required handles your blueprint-based creation rule.
Public Entrypoints makes exposure explicit.
May Import From handles outbound dependency rules.
May Be Imported By handles inbound visibility.
Forbidden gives a hard stop for common mistakes.
Allowed Direct Children  - direct subfolder names only
Allowed Files  exact filenames / filename patterns  / file roles / direct names or patterns when regular

Using a blueprint means recreating its complete folder structure at the target path, copying every `AGENTS.md` into the corresponding target folder, replacing blueprint placeholders such as `feature_name` with the target name, and following every copied instruction cumulatively. The complete folder structure and rule files MUST exist before implementation begins.


Every local `AGENTS.md` MUST use `/lib/local_template.md` as its exact schema. Preserve its section names and order, and complete every section with folder-specific rules.

Before updating any `.md` file anywhere in the project, the agent MUST present the proposed content to the user and receive explicit approval. Drafting the change without writing it to the project is allowed.



Domain fodler from features can not be dependent on anything else but itself (other files form the folder) or others Domain/shared (form other features)

Data contains DTOs, DTO-to-Domain mappers, and data-source interfaces. Files in Data may import files from the same feature's Data layer and, from Domain, only `domain/entities` and `domain/models` belonging to the same feature. The same feature's Infrastructure layer may import Data.

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
Always marks with SST for .... or SRP is ... only one line before variable or function
Always generate separate file for separate layers.
Clean architecture structure with clear Responsobilities, Single source of truth
Widgets should be simple and follow generic flutter approach, instead of taking alot of params they take child widget unless it is a comlex widget

Explicit states instead of flags → widely used
Sealed classes / unions → standard in modern languages
UI = function(state) → core idea of declarative UI
Impossible states by design → strong principle in Functional Programming
* no illegal states possible
* enforced by compiler / structure
* architecture defines allowed behavior
* AI/lint can validate code


You push full explicitness (no shortcuts)
You want closed state systems everywhere
You think in architecture rules, not just UI
You want it enforced (lint / AI / structure)

Declarative programing style:
bed: ifAbsent functions, ensurePresence or loadIfNeeded.
good: sealed state classes with exastive switch sysntacses, business logic separation from ui,

fail soon rule. dont do exastive checking on data validity, report fail instead of hiding

### Planing work

start working with estimating layers involved and folders need to do that always study `/lib/features/feature_name/AGENTS.md`
and other files inside project and use it as a responsobilities and architecture blue pring for creating and modificating folders.
store source task
define stages
estimate correctness and suggest spliting task
each task should containing planing/rewieving plan/implementing/reviewing/correting and you should always remind developer to do next stage
it may involve other stage
No renaming, No reformating , No refactor unless directly asked. Aleways Minimal code updated changes, Always following this rules if directly asked alwayes ask for confirmation.
ask if we need to write test but never do it by default
