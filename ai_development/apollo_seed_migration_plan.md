# Migrating a project seeded from an older Apollo

## Purpose and scope

Migrate the complete Apollo scaffold into a derived Flutter application: development skills, all reusable libraries, all examples and the App/Core/Shared wiring that makes them usable. Preserve the destination's product behavior, identity, data, integrations and local development rules. Import and reconcile the full scaffold by default; any exclusion or deferral needs an explicit developer decision and a recorded reason. Provider activation and production exposure remain separate from importing and wiring the code.

This is a reusable migration instruction for an agent working in the destination project. The destination project, original seed revision and enabled providers have not been supplied. No destination-specific diff, implementation, deployment or runtime verification has been performed. Start with the updater check below, then use the phases to produce and execute the project's concrete migration.

Source request: “write a migration plan for project that was seeded with old versions of apollo, how to update all meaningfull things.”

## Start here — check whether this project already has the updater

Give this document to the agent working in the older project's checkout. Start with:

```text
Use the attached Apollo migration instructions for this project. First check
whether our Apollo updater is already set up locally. Read the installed updater
and its configuration before proposing installation or replacement. Report what
is ready or missing, reuse our existing setup, and bootstrap only missing pieces.
Then use update-framework-harness for the harness update and these instructions
to migrate all Apollo examples, reusable libraries and supporting App/Core/Shared
code. Include dependencies, assets, DI, startup, routing, navigation and native
wiring. Preserve our product and configuration, report conflicts, and do not
silently omit examples or stop after importing skills. Present the concrete
changes before applying the scope that requires our decision.
```

Before proposing updater installation or any migration edits:

1. Establish the destination's Git root and read its applicable instructions. Look for `.agents/skills/update-framework-harness/SKILL.md`. If that path is absent, inspect the project's documented skill locations and local skill names/descriptions for an existing relocated or renamed Apollo updater. A similarly named global or sibling-project skill does not establish that this project has it configured.
2. Read the discovered local updater. Check its actual scope, required supporting files and local adaptations. Verify that its referenced harness/rules exist. At this reference revision, the updater handles harness changes; it does not implement the full application migration described below.
3. Inspect `ai_development/apollo_declarative_version.json` and `ai_development/apollo_declarative_update_history.md`. Validate the configured upstream repository, branch and commit against available Git/API evidence. Distinguish the last reviewed revision from the original seed. An inaccessible revision is unverified until access is restored; an absent marker is an unknown baseline.
4. If using shared-file synchronization, inspect `ai_development/sync_harness.py`, `ai_development/harness_sync_manifest.json` and any existing `ai_development/harness_sync_state.json`. The script previews/copies explicitly listed AI instructions; it does not migrate application source. Synchronization state is optional on a first run, where existing differing files can conflict. Its absence alone does not mean the updater is missing.
5. Report one of the following states with evidence paths and the next action:

   | Updater state | Evidence | Next action |
   | --- | --- | --- |
   | Ready | Local updater and required references are readable; tracking is valid and the comparison baseline can be resolved | Invoke that project's local `update-framework-harness`; reuse its configuration and history. Continue with the application comparison separately. |
   | Incomplete | Local updater exists, but required references/configuration are missing, invalid or unavailable | Identify the exact gaps. Recover or establish the baseline and repair only the required setup before invoking it. Existing local edits need reconciliation, not automatic replacement. |
   | Absent | Scoped searches found no local Apollo updater | Retrieve the updater and required references from the pinned Apollo target, then propose the minimal local bootstrap under the destination's rules. |

For an incomplete or absent setup, preserve existing files and inspect the pinned upstream definitions as source evidence. Adopt only missing/selected skill resources and supporting instructions; the manifest can help identify them. Obtain any file-specific instruction approval required by the destination. Follow the updater's baseline procedure: use verified ancestry/history when available, and ask the developer to establish a starting point when it cannot be recovered. Never copy Apollo's own version/history or set the destination's baseline to the new target merely to make setup appear complete. Verify installed references and tracking, then invoke the updater locally.

When required upstream content cannot be accessed, report that access blocker and continue independent inventory work. Do not report the updater as absent merely because a remote request failed. Discovery and comparison leave application files and the review marker unchanged; selected application edits follow the migration phases and existing authorization.

**First report:** updater state, local skill path, configured upstream, recorded baseline and whether it is verified, exact missing/conflicting pieces, selected target revision, and next action. Updater readiness describes the ability to run its workflow; it does not establish that the project is up to date.

## Required migration outcome — the complete scaffold works in the old project

The updater check is the entry step. Completing the harness update leaves the application migration outstanding. Inventory and reconcile these groups from the pinned target, including additions beyond this guide's reference:

| Group | Required coverage at the reference revision |
| --- | --- |
| Reusable libraries | Every module under `lib/libs`: `app_haptic`, `app_logger`, `app_settings`, `authentication`, `errors`, `shake`, `subscriptions` and `uikit`, including their contracts, implementations, integration blueprints and component documentation |
| Runnable examples and features | About Apollo/version/log sharing; legacy and alternative bottom sheets with completion callbacks; local/push notification actions; authentication/registration; Profile; Settings; subscription management; generated OpenAPI backend sample; streaming Chat with tools, usage and memory controls |
| Reusable UI families | UIKit layouts, theme/typography helpers, buttons, input sheets/fields and `app_chat`, plus the project Shared adaptations their consumers need |
| Composition and runtime foundations | Relevant `lib/app`, `lib/core` and `lib/shared` source: bootstrap, app/shell, DI helpers and coordinators, session/settings lifecycle, failure handling, router/redirects, notification routing, navigator configuration and disposal |
| Supporting artifacts | `packages/sheet`, `packages/apollo_api_client`, generator inputs/tooling, package dependencies/locks, registered assets/translations, required native configuration, feature specs/diagnostics and relevant existing tests |
| Templates and service source | `feature_name` remains a development blueprint, with no artificial runnable route. Include reusable Functions/rules/indexes or backend-contract artifacts required by the examples; configure and deploy them only to the destination's agreed environment. |

Build a complete source-to-destination inventory from the actual target tree, feature/library entrypoints and their transitive dependencies. Account for source that moved or already has a destination equivalent. Reuse/reconcile that equivalent rather than creating duplicate services, repositories, controllers or routes. A harness manifest does not enumerate the complete scaffold.

For each runnable example, identify its destination screen/entry action, route builder, Controller factory, feature/library registration, Core collaborators, package/assets/configuration dependencies and verification. Trace the whole path: **reachable entry → route → screen/Controller → contracts → implementations → configured service**, together with initialization and disposal. A copied folder with no reachable consumer is unfinished integration.

Keep the destination's production home and existing routes. Integrate Apollo's example catalog through its existing sample navigation or a proposed sample entrypoint; reconcile Apollo's `/` route rather than replacing the app's root. Resolve route collisions explicitly and preserve sheet return values, route parameters and supported back behavior. Preserve each example's behavior while adapting its paths and presentation to the destination's approved boundaries.

Distinguish **code imported**, **DI/routes wired**, **example reachable**, **provider configured** and **behavior verified** in the migration record. External-service examples may expose their supported unconfigured/disabled state until destination credentials and services are ready; label that state and its remaining live acceptance clearly. Importing all examples does not authorize enabling billing, changing authentication providers or deploying to an invented environment. A missing provider or unresolved collision is a reported gate, not permission to silently omit the example.

**Completion rule:** every library and example in the pinned target is accounted for; all included source and supporting artifacts are integrated; every runnable example has a reachable, checked entrypoint and required DI/lifecycle wiring. Record developer-approved exclusions and outstanding provider/runtime gates individually. A skills-only update cannot satisfy this migration.

## Reference revision and evidence

Updated on 2026-11-15 from these local repositories:

| Reference | Revision | Use |
| --- | --- | --- |
| Apollo Declarative, local `apollo1` checkout | `fbaaecb201862e6b9d014277647423279aa776b9` | Committed scaffold, runtime libraries, features, native integration, tools and Apollo workflow |
| Declarative architecture, this repository | `885e06f7df5bd0bd642b7196cb12f5e7664c96f6` | Architecture definitions and documentation placement |

The Apollo working tree was clean when this revision was inspected. This reference includes the committed chat delivery, authentication setup delegation, editable-email correction, review workflow updates and reconciled acceptance/documentation. No claim is made that either local revision is the latest published upstream. At execution time, select and record the desired published target once, then inspect immutable content at that revision. Rebuild the comparison if the target changes.

Useful committed reference entrypoints:

- [Apollo README](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/README.md).
- [Harness update skill](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/.agents/skills/update-framework-harness/SKILL.md) and [shared-unit manifest](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/ai_development/harness_sync_manifest.json).
- [Authentication setup skill](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/.agents/skills/setup-authentication-apollo-declarative/SKILL.md).
- [Chat specification](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/lib/features/chat/ai_development/feature_spec.md).
- [API generation instructions](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/tools/openapi/README.md).
- [Trusted subscription service instructions](https://github.com/konstantinvoronov/apollo-declarative/blob/fbaaecb201862e6b9d014277647423279aa776b9/firebase/subscriptions/README.md).

Historical plans can describe superseded behavior or incomplete verification. Reconcile them with committed implementation, current specifications and recorded acceptance evidence before using them as migration instructions.

### Changes since this guide's previous reference

- Root setup now discovers feature setup skills and delegates authentication to `setup-authentication-apollo-declarative`. The shared manifest also includes that skill and `project-management-apollo-declarative`. Resume recorded enable/defer/decline choices and unfinished configuration instead of restarting application setup.
- Fresh solution guards use separate `gpt-6-astra` reviewers at `medium` reasoning under the updated local skills. Staged finalization reuses valid evidence and coordinates the established tracker, commit/push, required deployment and closure under its documented authorization and explicit developer limits. Check reviewer/tool availability when adopting those instructions.
- Chat and reusable UIKit `app_chat` are committed capabilities included in the scaffold migration. Authentication now preserves its current email-code challenge/deadline during email editing. Include both in the component review below.
- Apollo now has committed Test Store purchase/restore and profile/provider acceptance records. Preserve their stated revision/environment limits; the destination still needs its own acceptance evidence.
- Project Firebase configuration is locally ignored and is not published with the source. The iOS project still has a `GoogleService-Info.plist` resource reference; check that the destination supplies the matching file and that a clean build resolves it. Install the destination's configuration for its enabled integrations and preserve valid native resource wiring during comparison.
- Scoped patterns and historical/processed violation evidence were reconciled. Review useful patterns as candidates through the destination's approval workflow; preserve its catalogs and history. Documentation cleanup is not a runtime change or evidence that a destination migrated.

## Migration records and decisions

Create the destination's migration record under its project-level `ai_development` folder. Use its existing implementation plan and work-record conventions; keep feature details in feature-owned documentation. Preserve existing histories and append the migration decisions.

Record three separate references:

1. **Original seed revision:** ancestry of the copied scaffold, if recoverable.
2. **Last reviewed framework revision:** the existing `apollo_declarative_version.json` marker, if present.
3. **Migration target revision:** the exact Apollo source being evaluated now.

Apollo's framework marker advances after a completed review session, including when updates are declined. It does not prove that all runtime code or even every offered harness update was adopted. Use history and the component ledger below to establish actual adoption. Keep application release numbering separate.

Use one ledger row per component or coherent file family, including unchanged destination equivalents and every example. Link each row to its source-to-destination inventory and record imported, wired, reachable, configured and verified status separately. Mark an area not applicable only with evidence; record developer-approved exclusions explicitly.

| Component and source paths | Seed → target change | Destination paths and local differences | Decision | Dependencies / data impact | Verification and result |
| --- | --- | --- | --- | --- | --- |
| Fill from the actual comparison | Behavior, contracts, additions, renames and removals | Exact files and consumers | Adopt / adapt / retain / defer / not applicable, with reason | Prerequisite components, config and compatibility | Command or observation; pass, fail, blocked or pending |

Preserve app identifiers, signing, store listings, Firebase projects, production endpoints, RevenueCat configuration, secrets, user data, local patterns, violation history and tracker configuration. Import reusable instructions selectively; initialize project-owned records from the destination's confirmed choices.

## Phase 1 — Establish the destination baseline

1. Complete the updater check above. Read the destination's root instructions, local harness, setup record, architecture rules and existing work records. Establish whether it is a derived app and which platforms/providers it ships. Build the full scaffold inventory required above rather than limiting discovery to the shared-harness manifest.
2. Inspect Git status. Separate existing work from the migration and preserve a recoverable baseline through the project's normal Git workflow. Use a migration branch in a suitable checkout. Keep other ongoing changes out of migration commits.
3. Recover the seed from retained Apollo ancestry, the original import commit, setup history and framework history. A merge base is useful evidence, but later merges can make it different from the original seed. For a copied/squashed project with no reliable baseline, record `unknown`; compare component content directly and avoid claiming a complete historical change range.
4. Pin the migration target and inventory upstream additions, modifications, renames and deletions from the verified baseline. Compare three versions where available: original Apollo, destination today and target Apollo. Follow renamed files and actual consumers.
5. Record Flutter/Dart, native build toolchains, package locks, generated artifacts, supported OS versions, build defines, environment selection, remote services and persisted keys/schemas.
6. Run the destination's existing relevant analysis, tests and supported builds before changes. Capture known failures and a small runtime baseline: startup, deep links, login/logout, settings and its main product flow.

**Exit:** known or explicitly unknown seed; pinned target; isolated work; initial component ledger; baseline verification with existing failures distinguished from regressions.

## Phase 2 — Review every meaningful update area

The paths below identify source responsibilities. Map them to the destination's architecture before proposing moves or replacements.

| Area | What to compare and migrate | What must be preserved or decided |
| --- | --- | --- |
| Agent entrypoints and local workflow | Root `AGENTS.md`, marked harness section in `lib/AGENTS.md`, `.agents/skills`, harness, project-management and ticket-record instructions. Review setup, triage, finalization, review guards and required supporting resources together. | Destination approval rules, tracker, workflow states and local skill adaptations. The shared manifest is a distribution allowlist, not a complete list of everything a skill needs. |
| Setup and review capabilities | Root setup delegation, `setup-authentication-apollo-declarative`, established tracker integration, staged finalization, separate Astra medium review guards and evidence-reuse checkpoints. | Existing identity/provider choices and outstanding setup. Verify required reviewers/tools are available; distinguish unavailable fresh review from reusable valid evidence. |
| Declarative architecture | General rules, `lib/local_template.md`, scoped guides and feature blueprint: ownership, scope, layers, role naming, inbound/outbound permissions, public entrypoints and override semantics. | Approved local exceptions. Review legacy dependency prose before converting it. Report contradictions; separate rule adoption from any source migration needed to satisfy it. |
| Dependency and native toolchain | `pubspec.yaml`, application/package locks, analysis options, Flutter/Dart constraints, Android Gradle/Kotlin/JDK and SDK configuration, iOS Podfile/lock/deployment target, vendored packages. | Destination signing, flavors and supported platforms. Adopt only dependency changes required by selected components; compare platform constraints before changing minimum OS versions. Avoid a blanket major-version upgrade. |
| App startup and DI | `lib/app/di.dart`, its helper entrypoints, Core coordinator, feature-root DI, initialization ordering, readiness, disposal and routing registration. | Existing startup behavior and all product registrations. Selected services initialize before consumers need them; asynchronous initialization must not introduce deadlocks or duplicate singletons. |
| Routing and session policy | App router/redirects, feature routing entrypoints, authentication/profile gating, pending destinations, notification destinations and back navigation. | Product URLs, deep links and navigation policy. Custom redirects must compose the chosen authentication behavior. Settings remains accessible when remote account hydration fails. |
| Core state, failures and lifecycle | `app_failure` / `AppResult`, `stateful_data`, relevant usage guides, Core settings/session repositories, account lifecycle contracts, SessionManager, haptics, shake and build metadata. | Typed states and visible failures; session clearing and stale-operation rejection. Preserve stored keys and device preferences unless an explicit data migration is approved. |
| Logging and support export | `app_logger`, Core logger/log-share contracts, failure chains, session correlation, archive/share integration and feature diagnostic specs. | Project redaction and retention policy, support destination and configuration. Derive archives from the app's logs; choose project-owned archive configuration and verify native sharing. |
| UIKit, layouts, themes and inputs | `lib/libs/uikit`, project Shared adaptations, layout references, input fields/sheets, buttons, typography, theme/sizing contracts and callbacks. Include `packages/sheet` when required. | Product design, custom components, localization and accessibility. Review callers when signatures/defaults change. Check keyboard submit, waiting/error states, cancellation, mounted lifecycle, theme and back behavior. |
| Assets and generated presentation files | Translation assets/keys, registered images, generated asset Models, `flutter_gen` setup, icons and splash configuration. | Destination artwork, app name, supported locales and generated output ownership. Use the destination generator configuration; carry required new keys without replacing its translations. |
| Authentication | `lib/libs/authentication/core`, example app integration, reusable `firebase/authentication` service source and associated rules/configuration. Compare email-code contracts, provider restoration, token handling, resend/error states and registration. | Include code and example wiring while preserving existing provider, users and account-linking policy. Activating Firebase email-code login is a separate configuration decision. Preserve UID/account continuity; a provider change requires a separate account/data migration. |
| Profile and device settings | Profile and Settings features, public profile contracts, selected Firestore/REST adapters, session hydration, theme persistence and UI language ownership. | Remote account preferences and local device preferences have separate owners. Current Apollo separates account language from UI language. Do not silently copy values between them or change profile providers. |
| API clients and backend contracts | `tools/generate_api.py`, `tools/openapi`, provenance/checksums, generator/serializer locks, `packages/apollo_api_client`, adapters and example backend endpoints. | Destination API contracts, authorization and deployment compatibility. Generated types remain inside integration boundaries. Include the backend sample with its generator/client and reachable navigation; reconcile existing tooling and endpoint configuration. |
| Notifications | Core local/FCM contracts/adapters/mapper, App subscriptions/routing, optional push registration, Android channels/icons/permissions and iOS delegates/entitlements/background modes. | Explicit opt-in, destination Firebase/APNs identity, payload contract and registration owner. Immediate local display, push reception and server delivery are separate capabilities. Scheduling/server registration require their own scope. |
| Subscriptions | `lib/libs/subscriptions/core`, management UI, RevenueCat SDK integration, trusted access provider and `firebase/subscriptions` or matching custom backend. | Product catalog, stable authenticated identity, legal pages, restore/transfer policy and selected environment. Client purchase success cannot grant server authority. Android/store delivery needs its own acceptance evidence. |
| Chat and reusable chat UI | `lib/features/chat`, UIKit `app_chat`, SSE/WebSocket adapters, typed events, cancellation/session isolation, conversation history, tool/usage feedback, owner-memory controls, `web_socket_channel` and `gpt_markdown`. | Include feature/UI source and wiring; preserve the destination's AI/provider and paid-access policy. At this revision, Flutter uses the custom backend with Firebase account credentials; Firebase AI Logic and a chat Functions gateway were not delivered. Backend service contracts/configuration require separate verification. |
| Backend and persisted data | Selected Functions codebases, Firestore rules/indexes/database, REST/SQL routes and migrations in the separately owned backend, parameters, secrets and webhooks. | Current production schema, ownership permissions and existing Functions. Keep authentication/subscription deployments scoped. Review schema migration, existing-client compatibility and rollback together. |
| Examples, documentation and CI | All runnable examples and their navigation/actions, feature specs, implementation records, diagnostics, focused tests, generator checks and existing CI. | Existing product features and historical evidence. Include examples by default; escalate conflicts and obtain explicit decisions for exclusions. Copy relevant acceptance criteria; upstream test success is not destination runtime evidence. |

For each row, also inspect removed APIs and destination references to deprecated paths. Delete obsolete code only after consumers and persisted compatibility are accounted for.

**Exit:** a complete review ledger, an adoption decision for every area, exact source/destination mappings for selected work, and unresolved decisions made visible.

## Phase 3 — Update the local development harness

Use the destination's local `update-framework-harness` established by the initial updater check. Reuse an existing installation; complete only evidenced setup gaps. Its scope at the reference revision is harness comparison and adoption. This guide supplies the broader application review; adopting the guide does not change the skill's implementation. Plan runtime migration through the remaining phases.

1. Compare the target's synchronization manifest with the destination's current manifest/state. Inspect changed skills and their referenced files; include required files that are outside the manifest in the manual proposal.
2. Preview from an isolated source snapshot containing the pinned target. The utility supports absolute paths:

   ```sh
   python3 /absolute/path/to/pinned-apollo/ai_development/sync_harness.py \
     --source /absolute/path/to/pinned-apollo \
     --target /absolute/path/to/derived-project
   ```

3. Review each create/update/conflict. Use repeated `--path` arguments for selected manifest entries. Reconcile local adaptations; `--accept-source` records a deliberate source choice and is not approval to erase local work.
4. Present exact proposed contents for each affected `AGENTS.md` under the destination's approval rules. The current Apollo harness requires explicit file-specific approval. Resolve protected-source permissions for later phases separately. `lib/main.dart` is frozen under the current harness and needs direct approval of its exact change if one becomes necessary.
5. Apply the reviewed selection with `--apply`. It writes synchronization state in both source and target and backs up replaced files, so use the isolated source snapshot rather than a developer's active Apollo checkout.
6. Review setup/tracker integration against actual destination choices, including feature-owned authentication setup and reviewer availability. Preserve project-owned setup records, completed setup flags, tracker IDs, maintenance timestamps, patterns and violation history. Keep application-source migration in Phases 4–5 rather than transferring it through the harness sync. Review the current manifest's authentication/project-management additions and the supporting references of every selected skill.
7. Run context-checker against the resulting local workflow. Verify referenced skills/resources exist. Report new rule/source contradictions and scope remediation before making architecture-wide moves.

**Exit:** selected harness units work within the destination; local rules/state are preserved; source migration obligations and any pending instruction approvals are explicit.

## Phase 4 — Migrate shared runtime foundations and composition

Order by the actual dependency graph: required toolchain/packages → value/contracts and state/failure compatibility → reusable implementation and project adapters → Core registration/lifecycle → App wiring and consumers.

For each component, prepare a concrete proposal identifying its responsibility, owning scope/layer, public contract, exact file mapping, callers, config and persistence impact. Use the destination's responsibility resolver before introducing objects or changing responsibilities. Check dependency permissions in both directions.

- Three-way reconcile modified foundations instead of copying whole `lib/core`, `lib/shared`, `lib/libs` or `lib/app` trees.
- Protected reusable source requires the destination's explicit authorization. Keep product adaptations at the permitted project-owned boundary. Resolve conflicting legacy Shared declarations before choosing new paths.
- Update contracts and all required callers together. Remove replaced registrations and listeners; verify one lifecycle owner for initialization and disposal.
- Migrate UI families with their Params, callbacks, imports, localization, theme helpers and relevant native/package dependencies. Preserve product styling intentionally.
- Regenerate assets and other derived files with the selected toolchain after source/configuration changes. Keep generated output and its inputs in the same review unit.

### Wire imported source into the destination app

Use the pinned Apollo composition as a reference and reconcile it with the destination's equivalent owners:

1. **Startup and Presentation:** integrate `lib/app/app_bootstrap.dart`, `lib/app/app.dart`, `lib/app/app_shell.dart`, navigation configuration and required Shared layout/failure/snackbar adaptations. Preserve theme/localization initialization and startup sequencing. Respect the destination's protection of `main.dart`; propose its exact change only if the existing bootstrap cannot support the integration.
2. **Core registration and lifecycle:** reconcile `lib/app/di.dart`, `lib/app/di/core_di.dart` and `lib/core/core_di.dart`. Register library services, repositories and session participants once, preserve asynchronous readiness dependencies, and initialize/dispose through their owning entrypoints. Do not replace the destination's container or omit its registrations.
3. **Feature registration:** reconcile `lib/app/di/features_di.dart` with each feature-root `di.dart` and required library DI entrypoints. Cover About Apollo, backend sample, Profile, Settings, subscriptions and Chat; authentication/subscription library services register through Core at the reference revision. Resolve all factories and their dependencies before opening screens.
4. **Routes and visible entrypoints:** reconcile `lib/app/routing/app_router.dart`, feature/library route builders, authentication/profile redirects and notification interactions. Add navigation to every imported example and resolve root/path conflicts. Verify legacy and alternative sheet routes with their Params/callbacks and result propagation.
5. **Packages, assets and native consumers:** merge dependency declarations, required local packages, translations/asset registrations and generator inputs. Reconcile native permissions, delegates, plist/resource references and supported platform requirements. Update all imports that reference Apollo's original Dart package identity to the destination's package.

Keep each integrated slice buildable. Verify actual construction/navigation as well as static imports; a registered factory may still fail on first resolution. Record remaining dependent example slices explicitly before continuing to Phase 5.

**Exit:** all reusable library families and shared foundations are accounted for; foundational App/Core/Shared composition is integrated; existing product startup, session/device persistence, routing and UI regressions pass. Phase 5 completes and checks each example's consumer wiring.

## Phase 5 — Integrate every example and feature capability

Deliver separate, working slices in dependency order for every example in the pinned target. Reuse an existing equivalent when it preserves the example's behavior and record its mapping. Code import and navigation are included by default; activation of external providers follows the destination's confirmed choices. Resolve exclusions with the developer rather than silently treating demos as unnecessary.

1. **Authentication and account lifecycle:** reconcile the current provider and public contracts first; then session coordination, registration/profile integration and route gating. Use the local feature setup skill for unfinished selected configuration, preserving existing choices. Verify restore, sign-in/out, expiry/retry, account switching and rejection of late results from the previous identity. For Apollo email codes, verify server-owned expiry/limits/single-use behavior and both keyboard and button submission paths. Test focusing email/Back, normalized unchanged-email submission before/after cooldown, changed-email requests, explicit resend and challenge clearing after session completion/sign-out. Editing must preserve the absolute deadline and must not issue another code for an unchanged address. This client Presentation correction alone requires no backend deployment.
2. **Profile and Settings:** preserve the selected authoritative store and persisted fields. Verify profile hydration/editing/registration, local theme/locale persistence and Settings access during provider failure. Moving Firestore profiles to REST selects a different store; importing the adapter does not transfer records. Specify any transfer as separate work with mapping, validation and rollback.
3. **API/backend integration:** pin the intended schema and source provenance; update generator configuration and locks as needed; regenerate and run `python3 tools/generate_api.py --check`. Review actual generator selection: at the reference revision it includes `/healthz` and `/profile/me`, while the README's introductory description still mentions health only. Confirm the destination's required endpoints from code/schema. Test transport serialization and authentication before wiring UI.
4. **Notifications:** integrate local display/cancel, FCM adapters, interaction routing, token lifecycle and the example actions. Activate push reception according to the destination's confirmed configuration. Supply project-specific native configuration. Verify permission denial, foreground/background/terminated delivery, duplicate interactions and signed entitlements on supported devices. Confirm who sends pushes and owns registration separately.
5. **Subscriptions:** integrate identity/session handling and disabled mode, then purchase/restore UI and trusted access refresh. Configure the destination's offerings, entitlement, SDK key, legal URLs and trusted endpoint. Verify cancellation, pending purchase, expiry/grace, provider outage, webhook retries/duplicates/transfers, account switching and server-side denial at each real paid operation.
6. **Chat:** integrate the feature and reusable UIKit family, matching backend history/streaming/tools/memory contracts and the selected account/paid-access policy. Verify SSE and optional WebSocket identity/order/terminal semantics, Stop/partial output, account-switch cancellation, persistent paid-denial feedback, memory ownership/correction/forgetting and no automatic generation replay. Keep credentials in authenticated requests rather than URLs; provider keys stay server-owned. A schema/client update alone does not establish backend chat deployment. Exercise RevenueCat Test Store integrations with the required native Debug configuration rather than profile/release builds.
7. **Example catalog and local demonstrations:** finish About Apollo/version/build display, log-archive sharing, legacy/alternative bottom sheets and local-notification actions, plus navigation to all imported screens. Verify each visible action resolves its Controller/services and reaches its destination. Confirm sheet completion/cancellation results, native sharing, supported theme/localization and return navigation. Preserve existing product entrypoints while making the catalog reachable.

**Exit:** every included example has source, supporting libraries, actual DI/routes and a checked reachable entrypoint; each capability has a configuration owner, feature spec, diagnostics and clearly stated verification. External provider gates and developer-approved exclusions remain individually recorded.

## Phase 6 — Environment, backend and data rollout

For each selected provider, record destination-owned values and the configuration channel: Firebase app/project/database/Functions region, authentication email service, REST origin/token verifier, FCM/APNs setup, RevenueCat offerings/entitlement/webhooks, legal URLs and relevant build defines. Keep secret values in the configured secret provider; document references and owners.

Review all inherited `APOLLO_*` settings, default endpoints and feature flags. Decide each value explicitly for development, staging and production. Use destination-owned Firebase registrations/configuration and credentials rather than Apollo's test-project values. Keep external integrations disabled or visibly unconfigured until their configuration and prerequisites pass; retain their imported source and example wiring.

Before changing persisted data, enumerate SharedPreferences keys, session namespaces, profile fields, identity mapping, entitlement records and any SQL schemas. Classify changes as compatible, requiring migration or requiring a new feature/provider decision. Preserve existing local theme/locale data and remote account-language data unless a specific transfer is approved.

Roll out compatible backend routes/schema and rules before clients depend on them. The referenced REST profile specification requires backend routes and SQL migration `005`; verify those artifacts in the selected backend revision and its current migration sequence. This Flutter checkout does not establish the backend's deployed state. Review Firestore rule ownership and Admin-only subscription records against the destination's existing rules instead of replacing its entire rules file.

Use staging and a recoverable data snapshot for destructive changes. Prefer additive schemas and a compatibility window for older app versions. Define what happens on downgrade; reverting a Flutter commit does not reverse database changes, external purchases or deployments. Scope deployment to the chosen codebase/environment and perform it only under the destination's deployment authorization.

**Exit:** configuration and deployment evidence match the destination, old-client compatibility is established, and data/rollout rollback actions have named owners.

## Phase 7 — Verification and acceptance

Keep compile, architecture, unit/widget, emulator, live-service and device evidence separate. Record exact revision, environment, command/observation and result. Compare against Phase 1 failures. Run the destination's existing tests appropriate to changed behavior and add focused regression coverage where required by the change and local rules.

| Gate | Required evidence for selected scope |
| --- | --- |
| Scaffold completeness | Every target library/example mapped; source, packages/assets and supporting dependencies present; explicit decisions for exclusions; no silently skipped examples |
| DI and navigation integration | Construct every example Controller and required service graph; launch/navigate to each example; verify catalog links, route parameters, redirects, sheet results, initialization/disposal and preservation of existing product routes |
| Static and generated integrity | Scoped/full analysis as appropriate; no new unresolved errors; clean formatting/diff checks; assets and API generator drift checks |
| Architecture and workflow | Local pattern keeper, naming, declarative rules, responsibility leakage, scope/decomposition and diagnostic audits; instruction/protected-file approvals verified |
| App regression | Cold/warm startup, app links, navigation/back, existing main flow, loading/error/retry, light/dark theme, supported locales, keyboard and screen disposal |
| Session and persistence | Upgrade from the old app with existing data; restoration, account switch/logout, stale completion isolation, retained device preferences and profile ownership |
| Enabled backend capabilities | Provider contracts, authorization/ownership rules, missing/expired credentials, outages and retries; relevant existing Functions/emulator and backend tests |
| Native delivery | Builds for every supported affected platform; configured devices for notifications/native sharing/store behavior where adopted; signed configuration when required |
| Subscription acceptance | Real configured sandbox purchase/restore, trusted verification and actual protected-operation allow/deny; server retry/environment/account isolation |
| Chat acceptance | Matching backend contract/deployment when configured; incremental streaming and Stop, stale-session isolation, admission/paid-denial behavior, conversation/memory ownership and themed/keyboard/scroll UI; label unconfigured/runtime gates separately |
| Release compatibility | Previous app version against the upgraded backend, migration idempotence/recovery where applicable, config isolation and staged rollback procedure |

Pending live/device evidence stays pending even when fixture tests and builds pass. Do not inherit upstream acceptance claims as evidence for the derived app. Keep each affected feature's specification and `<feature_name>_logs_test_spec.md` aligned with the behavior actually shipped and observable diagnostic limits.

**Exit:** required migration acceptance passes, or a specific remaining gate prevents the affected capability's release. Record accepted deferrals independently from passed checks.

## Phase 8 — Commit, record adoption and hand off

Use the destination's tracked-work and finalization workflow. A practical sequence of independently reviewable changes is:

1. Baseline inventory, adoption ledger and approved harness update.
2. Required toolchain/shared foundations with coherent callers and generated outputs.
3. UI/input and app-composition changes that can be verified independently; combine them with foundations when API compatibility requires it.
4. Authentication/profile/settings slices, each with the backend prerequisite it needs or an explicit deployment dependency.
5. Notification, subscription and Chat source/example integration as separate deliveries, ordered by their dependencies; provider activation and deployment retain their own gates.
6. Final compatibility/rollout evidence and migration records.

Keep implementation, tests, specs and diagnostics for one outcome together. Avoid commits that leave the app unbuildable merely to divide layers.

After each accepted slice, update the ledger with exact source revision, destination commit, decision and verification. Advance `apollo_declarative_version.json` only under the established harness update workflow after the final decision and completion of selected harness changes; explain skipped items in `apollo_declarative_update_history.md`. Preserve the seed and runtime adoption records separately. Do not advance the marker for an interrupted review.

Scaffold integration completion means all target libraries/examples and their supporting source are mapped and reconciled, every included example is reachable with resolved DI/lifecycle wiring, required integration checks pass, and any developer-approved exclusions are recorded. Full configured acceptance additionally requires the enabled providers' runtime/deployment gates to pass. Preserve or explicitly migrate persisted data/product configuration and record the verified commits/deployment state. Installing skills, copying source or advancing the harness marker alone cannot establish either completion state. “Reviewed through revision X” and “adopted component Y from revision X” remain distinct claims.

## Immediate next step

In the destination project, start with the updater check and report whether its local updater is ready, incomplete or absent. Reuse or complete that setup, establish the selected Apollo target and proceed to Phase 1's component ledger and exact proposed changes. This document describes the workflow; implementation authority comes from the developer's request and the destination's applicable rules.
