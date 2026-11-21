# UIKit bars implementation

Source request: “lets take AppScreenBar from apollo and adopt BottomsheetAppBar from meetpay.”

## Scope

Add two reusable header widgets to this blueprint's UIKit Core Presentation layer.
Read Apollo and Meetpay as references; keep all destination changes in this
repository. Preserve the pre-existing migration plan and review-work files.

## Responsibility resolution

- Scope: library-wide Core in `lib/libs/uikit`.
- Layer and kind: Presentation, concrete rendering widgets.
- Names and paths: `AppScreenBar` in
  `lib/libs/uikit/core/presentation/widgets/app_screen_bar.dart`; `BottomSheetAppBar`
  in the adjacent `bottom_sheet_app_bar.dart`.
- Role and naming/location compatibility: reusable screen and sheet headers;
  snake-case filenames correspond to their PascalCase declarations. RESOLVED.
- Public exposure: ordinary reusable widget files, directly importable by
  permitted project and library Presentation consumers. Shared copies are not
  needed for unchanged reusable source.
- Outbound dependencies: Flutter Material rendering and Flutter services haptics.
  No project imports, feature implementations, App DI, or router dependencies.
- Inbound consumers: UI in `lib/core/presentation`,
  `lib/features/<feature>/presentation`, and corresponding reusable-library or
  Shared Presentation paths, subject to each consumer's scoped declarations.
  Domain, Data, and Infrastructure must not consume UI widgets.
- Non-responsibilities: business coordination, service registration, external
  integration, application route selection, theme storage, and localization.
- Governing evidence: `ai_development/declarative_foldering_rules.md:31`
  (library scope), `:91` (rendering widgets), `:130` (Domain boundary), and
  `:163` (two-sided dependency checks); `lib/AGENTS.md:11` (declarative
  authority); `lib/libs/AGENTS.md:9` (reusable ownership), `:15` (direct source
  consumption), `:19` (library children), and `:27` (naming).
- Conflicts: none for the two proposed widget paths. No protected existing
  source or architectural declarations are changed.

## Stages

1. Inspect source widgets and destination dependencies — complete.
2. Resolve scope and adapt source behavior to Flutter-only dependencies — complete.
3. Document retained behavior and integration differences — complete.
4. Format, analyze, and run existing tests — complete.
5. Review patterns, naming, declarative compliance, responsibility leaks,
   diagnostics, and task scope — complete.

## Acceptance

The two widgets compile without additional package dependencies. Screen-bar
variants and sheet title/back/actions behavior are documented. Verification
results and remaining limitations are recorded before handoff.

## Verification results — 2026-11-15

- `dart format` on both new Dart files: PASS.
- `dart analyze lib/libs/uikit/core/presentation/widgets`: PASS, no issues.
- `flutter test --no-pub`: PASS, existing counter smoke test (1 test).
- No new tests were added. The existing test does not render either new widget.
- `git diff --check`: PASS for tracked changes. The new files are untracked;
  their whitespace is checked separately before handoff.
- Device interaction, navigation dismissal, screenshots, and branded visual
  parity: not verified.

## Final read-only reviews

| Check | Result and evidence |
| --- | --- |
| Declarative placement, ownership, and naming | PASS. Both new files are concrete rendering widgets under library Core Presentation. Project-level documentation is under `ai_development`, governed by `ai_development/AGENTS.md:9`. |
| Dependencies and entrypoints | PASS. `app_screen_bar.dart:1` imports only Flutter Material; `bottom_sheet_app_bar.dart:1` and `:2` import Material and Flutter services. There are no project import/export crossings to check in either direction and no current production consumers. Future consumers remain subject to their own layer rules. |
| Blueprint requirements | NOT APPLICABLE. No feature, DI, routing, or shared integration blueprint is introduced. |
| Protection and approval | PASS. The request authorizes adopting these two components. No existing protected source, `AGENTS.md`, or frozen `lib/main.dart` changes. Source repositories are read-only references. |
| Naming | PASS. Class/file names describe their header consumers. Factory names follow lower camel case. Existing source declarations and callers are not renamed. `text`, `backButtonTap`, and `paddings` retain Meetpay's public input vocabulary. |
| Responsibility leaks | PASS. Both declarations match the resolved concrete widget profile. `AppScreenBar.build` (`app_screen_bar.dart:91`) renders the header and supplies a caller-overridable back control. `BottomSheetAppBar.build` (`bottom_sheet_app_bar.dart:20`) renders the sheet header; its close callback (`:49`) supplies UI haptics and Navigator dismissal. Neither owns business logic, app-specific route policy, service registration, or mutable state. No declaration violations or confirmed leaks found. |
| Pattern keeper | PASS. `ai_development/patterns.md` is empty; no ancestor subtree catalogs exist for the changed files. No patterns invented or changed. |
| Violation collection | NOT APPLICABLE. The available user messages contain no developer-declared violation with a reason. No violation history is created. |
| Diagnostic specification audit | DIAGNOSTIC LIMITATION. These reusable UI components have no feature or runtime logs. Title layout, back callbacks, actions, and dismissal require consuming UI verification, as recorded in `uikit_bars_spec.md`. No logging instrumentation or artificial feature log specification is added. |
| Task decomposition | PASS. One destination project, no product features, one coherent outcome: adopt the requested pair of reusable headers. The two reference applications and pre-existing untracked work are excluded from the change set. |

The next integration step is to use the components in a consuming screen and
modal sheet and verify their appearance and interactions there. That integration
is outside the requested library adoption and has not been performed here.
