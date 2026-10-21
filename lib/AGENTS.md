# AI Agents Guide (`AGENTS.md`)

<!-- shared-ai-harness:start -->
## Project-Local Harness

Follow `/ai_development/ai_harness.md`. Execute skills from this project's `.agents/skills`, not a sibling repository. Follow its early scope-expansion warning, not a full planning procedure for every edit. `lib/main.dart` remains frozen without separate direct approval of its exact change. At finalization, use the local pattern keeper and collect unprocessed user-declared violations before the final read-only audits. Pattern catalogs inherit cumulatively with specific subtree overrides; do not preload unrelated catalogs or create one per folder. Harness maintenance is developer-invoked only.
<!-- shared-ai-harness:end -->

## Declarative Foldering Authority

Read [Declarative Foldering Rules](../ai_development/declarative_foldering_rules.md) before resolving architectural placement or dependencies. That document is the source of truth for default ownership, scope, layers, responsibilities, and import/export directions.

This root guide and applicable descendant `AGENTS.md` files are scoped override declarations. Omitted fields inherit the document defaults; only explicitly declared, approved differences replace corresponding rules within their scope. Do not duplicate the general architecture or silently treat contradictory legacy text as an intentional override.

This file defines how agents must work with repository. It only cover certain places we manage to get hands on

Main rule - keep it simple, always try to find simple, streamlined, easy to digest solution
that will do the job. no overengenering, optional things or extra cautios.


# Foldering architecture

In this project it is important to position files in the correct architectural folders. Applicable blueprint and general layer rules define their responsibilities, structure, naming, and dependencies. A separate local AGENTS.md is needed only for an uncovered requirement or exception.


in this project we are treating the filesystem as the architecture contract for agents and developers,
not just as storage.

Architectural blueprint rules define the following; local guides state only uncovered requirements or exceptions:

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

## Project Instructions and Scoped Overrides

### Image asset formats

Follow the image asset format rules in /ai_development/declarative_foldering_rules.md for project artwork and image assets.

### Architectural-rule approval safeguard

Architectural-rule changes must match the exact proposed and approved content. Approval of an architectural outcome does not authorize additional constraints, prerequisites, or documentation requirements. Any newly discovered policy decision must be presented separately. Reviews must check both compliance and approval provenance.

### DI startup and registration boundaries

`/lib/app/di.dart` owns the GetIt container and initialization sequence. Its project imports are restricted to `/lib/app/di/`; Dart SDK and `get_it` remain permitted for wiring. The feature helper `/lib/app/di/features_di.dart` may import only public feature-root `/lib/features/<feature_name>/di.dart` entrypoints. The Core helper `/lib/app/di/core_di.dart` may import only `/lib/core/core_di.dart` as a project dependency. Both receive the container as an argument and are consumed only by the global DI entrypoint. Core's coordinator owns Core registrations, not feature registration or application routing/authentication policy. Resolve both dependency directions at every hop; this wiring does not permit importing feature internals.

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


Local `AGENTS.md` files use the applicable section names and order from `/lib/local_template.md`. Include only uncovered requirements or exceptions; omit inherited sections rather than restating them.

Before updating any `.md` file anywhere in the project, the agent MUST present the proposed content to the user and receive explicit approval. Drafting the change without writing it to the project is allowed.



## Logging Foldering structure and architecture

foldering is important - it defines scope, responsobilites and give instructions,
read applicable root, blueprint, and ancestor AGENTS.md files; do not create missing local guides unless an uncovered requirement or exception needs one.

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
