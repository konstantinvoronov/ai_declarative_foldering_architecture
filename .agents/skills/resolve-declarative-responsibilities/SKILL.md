---
name: resolve-declarative-responsibilities
description: Resolve the intended architectural scope, layer, implementation kind, object role, designed responsibilities, and both dependency directions declared by repository foldering, cumulative AGENTS rules, and naming. Use before comparing actual implementation behavior with its declarative responsibility profile; do not use implementation behavior to redefine that profile.
---

# Resolve Declarative Responsibilities

Return the designed responsibility profile declared for a source object. This is a read-only interpretation of the declarative architecture, not an implementation audit and not necessarily an interface contract.

## Inputs

Use the object's repository path, filename, and declaration name together. When the caller provides a method, also resolve the method role declared by its name without losing the containing object's declarations.

Read every applicable `AGENTS.md` from the repository scope down to the object's folder. Apply their folder responsibility, `SRP`, dependency, naming, entrypoint, consumer, and visibility rules cumulatively.

## Resolve every declaration together

Resolve folder location, filename, declaration name, and applicable rules in one pass. None of these declarations overrides another.

Use foldering to determine:

- project, feature, or shared scope;
- architectural layer and responsibility boundary;
- implementation kind: abstraction, concrete implementation, value declaration, wiring, or unresolved;
- public, shared, private, or wiring visibility;
- responsibility assigned to the containing folder.

Use naming to determine the declared object role and designed responsibility. Treat role names such as `Repository`, `DataSource`, `DTO`, `Mapper`, `Controller`, `Manager`, `Flow`, `UseCase`, `Validator`, `Formatter`, `Params`, DI, and routing as declarative responsibility claims. Use operation names to refine the designed operation or lifecycle transition when the applicable naming rules define one.

Use file and declaration naming patterns from the applicable folder rule to verify that the named role is permitted at that location. Naming declares the object's intended type and responsibility; location declares its scope, layer, visibility, dependency permissions, consumer permissions, and expected implementation kind.

Determine implementation kind independently from object role. For example, a Domain repository interface is an abstraction, an Infrastructure repository is a concrete implementation, and a Core Manager is concrete unless its applicable rules explicitly declare an abstraction. Do not interpret the word `Manager` as an interface requirement.

Resolve both dependency directions from the cumulative rules:

- `May Import From` defines the outbound dependencies the object may consume;
- `May Be Imported By` defines the inbound consumers that may depend on the object;
- `Public Entrypoints` and shared-export rules define how an otherwise permitted dependency must cross the boundary;
- narrower child-folder rules constrain permissions inherited from parent folders.

Naming and foldering describe what the object is designed to own. They are evidence of intent, not evidence of what its implementation actually does.

## Detect declaration contradictions

Compare all declarations before producing the profile. Do not silently choose the name, the filename, or the folder as the authoritative interpretation. Do not relocate, rename, or reinterpret the object mentally to make the declarations agree.

When declarations conflict, preserve each declaration and name every applicable violation:

- `FILE NAMING VIOLATION`: the filename does not match a pattern allowed by its folder;
- `DECLARATION NAMING VIOLATION`: the declaration name or prefix does not match the role allowed by its folder;
- `IMPLEMENTATION KIND VIOLATION`: abstraction, concrete implementation, value declaration, or wiring is declared in a location assigned to another kind;
- `LAYER PLACEMENT VIOLATION`: the named responsibility belongs to a different declared layer or responsibility folder;
- `SCOPE VIOLATION`: a feature-specific, app-wide, shared, or library responsibility is declared in the wrong scope;
- `ENTRYPOINT OR VISIBILITY VIOLATION`: the object's declared exposure conflicts with its folder's public, shared, private, or wiring boundary;
- `DECLARATIVE RULE CONFLICT`: two applicable rules assign incompatible declarations and neither may be chosen silently.

A conflict result describes the incompatible declarations; it does not guess which declaration the developer intended. The later implementation audit may provide evidence about actual behavior, but it does not erase these declaration violations.

## Preserve the boundary between design and implementation

Do not inspect method bodies, branches, collaborators, state changes, side effects, or runtime behavior to determine the designed responsibility profile. Do not broaden or rewrite the profile to accommodate the current implementation.

If the path and name make conflicting declarations, return the conflict. If an applicable rule is missing or ambiguous, report the unresolved field rather than inferring it from implementation behavior.

This skill does not decide whether leakage exists. `check-responsibility-leaks` separately determines actual implementation responsibilities, dependencies, and consumers and compares them with this designed profile.

## Output profile

Return one structured designed responsibility profile containing:

- `scope`: project-wide, app-wide, shared, feature-specific, or library scope, including the feature when applicable;
- `layer`: the declared architectural layer;
- `implementation_kind`: abstraction, concrete implementation, value declaration, wiring, or unresolved;
- `naming_declaration`: the responsibility and object type declared by the filename and declaration name;
- `location_declaration`: the scope, layer, expected role, implementation kind, dependency boundaries, consumer boundaries, entrypoints, and visibility declared by the folder;
- `compatibility`: whether the naming and location declarations agree;
- `object_role`: the named role and folder-expected role, preserving both when they conflict;
- `designed_responsibilities`: behavior this kind of object is intended to own;
- `designed_non_responsibilities`: adjacent responsibilities assigned elsewhere when the rules identify them;
- `permitted_dependencies`: outbound layers, folders, contracts, representations, and entrypoints it may consume;
- `permitted_consumers`: inbound layers, folders, or entrypoints that may depend on it;
- `visibility`: public entrypoint, shared export boundary, private helper, wiring, or ordinary internal object;
- `rule_evidence`: exact `AGENTS.md` paths and one-based lines supporting each conclusion;
- `violations`: every named naming, implementation-kind, placement, scope, entrypoint, visibility, or rule conflict;
- `conflicts_or_unknowns`: conflicting declarations or information the rules do not resolve.

Finish with `RESOLVED`, `CONFLICT`, or `BLOCKED`. A syntactically correct name or folder never changes a conflict into `RESOLVED` without supporting declarative rules.
