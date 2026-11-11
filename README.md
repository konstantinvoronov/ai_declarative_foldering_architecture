# Declarative Foldering Architecture

A foldering system for Flutter projects where file paths declare architectural responsibilities and boundaries for developers and AI coding agents.

A folder tells you what belongs there, what it may depend on, and which other folders may consume it. The filesystem becomes an architecture contract that can be inspected before code is written and checked against the resulting implementation.

## Why declarative foldering

A conventional folder tree groups files by convention. Declarative foldering makes those conventions explicit: ownership, scope, layer, responsibility, naming, and dependency permissions become rules that developers and agents can consult together.

This helps answer concrete questions:

- Where does this object belong, and what responsibility should its name express?
- Is this a contract, an implementation, or a Presentation concern?
- May this folder import that folder, and does the target permit that consumer?
- Which declarations are public, and which must remain internal?

The focus of this repository is that foldering contract and its Flutter blueprint. [Apollo Declarative](https://github.com/konstantinvoronov/apollo-declarative) provides a working Flutter scaffold and the broader AI-assisted development environment.

## How a path declares architecture

Read an architectural path as:

**ownership → scope → layer → responsibility**

| Path | Architectural meaning |
|---|---|
| `lib/core/domain/repositories` | Project-owned, app-wide repository contracts |
| `lib/features/checkout/domain/repositories` | Repository contracts owned by the checkout feature |
| `lib/features/checkout/infrastructure/repositories` | Implementations of those feature repository contracts |
| `lib/features/checkout/presentation/controllers` | Per-screen UI logic and companion States for checkout |
| `lib/libs/app_settings/core/domain/repositories` | Reusable library-owned repository contracts in that library's Core scope |

Placement declares the intended responsibility. Reviewing behavior and actual imports establishes whether the code respects that declaration.

## Scopes and ownership

| Folder | Responsibility |
|---|---|
| `lib/app` | Application composition, configuration, and startup |
| `lib/core` | App-wide foundations and designated coordination boundaries |
| `lib/features/<feature>` | Functionality owned by an individual feature |
| `lib/libs/<library>` | Reusable ownership; architectural paths inside retain their scope and layer rules |
| `lib/shared` | Project adaptations of reusable blueprints; adapted paths retain their architectural meaning |

`app`, `core`, and `features` describe different responsibilities and scopes. `libs` and `shared` describe reusable ownership and project adaptation; they preserve the architecture inside them. Unchanged reusable source can be consumed directly through permitted entrypoints.

## Layers and responsibilities

Within a scope, folders separate contracts, representations, integrations, implementations, and UI:

| Folder | Responsibility |
|---|---|
| `domain` | Pure contracts, values, and Domain rules |
| `domain/repositories`, `domain/use_cases`, `domain/services` | Interfaces for their respective roles |
| `data/dtos`, `data/mappers`, `data/data_sources` | External data representations, conversions, and data-source interfaces |
| `services` | Concrete capability integrations |
| `infrastructure` | Concrete data sources, repository implementations, and use-case implementations |
| `presentation/controllers` | Per-screen UI logic and companion States |
| `presentation/models` | Presentation values and representations |
| `presentation/screens`, `presentation/sheets`, `presentation/widgets` | UI rendering and interaction through the designated Controller |

Create the folders needed for the responsibility being implemented. A minimal screen does not require empty Domain or Data layers.

Supporting responsibilities such as Wrappers, Formatters, Validators, and Mappers stay in their owner's scope and layer. Names and filenames express established architectural roles, such as `CheckoutRepository` and `checkout_repository.dart`.

The complete definitions and dependency directions are in the [foldering rules](ai_development/declarative_foldering_rules.md).

## Dependencies work in both directions

Every import or export must satisfy both sides of the boundary:

1. The consuming folder permits the outbound dependency.
2. The target folder permits the inbound consumer.
3. Scope, layer, responsibility, and public-entrypoint rules permit the relationship.

For example, Feature Domain may consume permitted Core Domain contracts and values. Core Domain cannot depend on Feature Domain. Domain stays independent of concrete Services, Infrastructure, Presentation, and App wiring.

Exporting a declaration preserves its architectural boundaries. A public export does not make an otherwise forbidden dependency valid.

## Scoped declarations with AGENTS.md

The [foldering rules](ai_development/declarative_foldering_rules.md) define the defaults. Applicable ancestor `AGENTS.md` files and explicitly approved local overrides refine them for a folder's scope.

A scoped declaration can describe:

- The folder's single responsibility (`SRP`).
- Allowed direct children, files, naming, and required blueprints.
- Public entrypoints and external dependencies.
- Outbound dependencies (`May Import From`) and inbound consumers (`May Be Imported By`).
- Explicit prohibitions.

Missing guides and omitted fields inherit. Add a local guide only for an uncovered requirement or approved exception. A more-specific dependency list replaces the broader list for its subtree and direction; an explicitly empty list permits no paths.

Dependency lists use repository-relative folder paths:

| Entry | Meaning |
|---|---|
| `/lib/core/domain` | Files directly in that folder |
| `/lib/core/domain/*` | The folder and all descendants |
| `!/lib/core/domain/internal/*` | Exclude that subtree |

These entries illustrate syntax; permissions come from the applicable declarations. Within a governing list, exclusions win and unlisted paths are denied. See the [local declaration template](lib/local_template.md) for the section schema.

## Explore and apply the blueprint

1. Read the [foldering rules](ai_development/declarative_foldering_rules.md) for the architecture contract.
2. Read the [lib guide](lib/AGENTS.md) and the guides along the path being considered.
3. Use the [feature blueprint](lib/features/feature_name/AGENTS.md) to inspect feature responsibilities and boundaries.
4. Resolve an object's role, ownership, scope, layer, name, and permitted dependencies before choosing its exact path.
5. Review actual behavior, imports, exports, and consumers against those declarations.

The repository includes architecture review instructions for [declarative compliance](.agents/skills/check-declarative-rules/SKILL.md), [naming](.agents/skills/check-naming/SKILL.md), and [responsibility leaks](.agents/skills/check-responsibility-leaks/SKILL.md). These are agent-executed reviews; their presence alone does not establish that code has been checked. The Python synchronization utility distributes selected instructions; it does not lint application architecture.

This is an evolving blueprint. Existing code and historical guides still need to be checked against the current contract, with unresolved contradictions reported for a rule decision.
