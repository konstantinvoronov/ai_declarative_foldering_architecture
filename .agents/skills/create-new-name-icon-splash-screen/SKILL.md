---
name: create-new-name-icon-splash-screen
description: Rebrand an Apollo-derived Flutter app with a new display name, approved icon artwork, and matching light/dark native splash screens on iOS and Android. Use for app branding changes and old-logo or wrong-theme launch problems; distinguish display branding from application-identity migration.
---

# App name, icon, and native splash

Deliver the requested identity consistently from the home-screen icon through native launch to the first app screen. Work inside the destination project; this skill carries no TrailTelling assets, identifiers, colors, signing settings, or dependency on the source repository.

## Establish the actual change

Read the destination's instructions and inspect its dirty state, platform targets, branding sources, theme tokens, icon/splash generators, and startup flow. Use the local context-checker if that workflow requires it. Follow destination protections for startup files and design approval; copying this skill does not import another repository's architecture rules.

Infer from available project context, then ask only for missing decisions:

- New display name and approved logo/source artwork. If artwork must be designed, establish the visual direction before generating shipping assets.
- Target platforms; use iOS and Android for a general mobile request unless the user limits scope. Do not silently rebrand desktop/web targets.
- Whether application IDs, Dart package name, or internal symbols must change. A new visible name alone does not authorize these migrations.
- Light/dark colors and which theme the first page uses. Native launch happens before Flutter can read app preferences; system appearance is the default basis. If the app has a saved independent theme, resolve how the native and first Flutter surfaces will agree rather than promising automatic parity.

Record a small identity map: display name, current and requested IDs, Dart package, artwork, colors, shipping icon catalog and splash resources. Preserve unrelated work.

## Apply the branding

Change the visible name at the actual platform entrypoints, including localized overrides. Inspect Android manifest labels/resources and iOS target display-name settings/Info.plist. Update current UI copy/assets within the agreed scope; preserve historical documents and serialized compatibility markers.

When the user explicitly requests an identity migration, follow all consumers together: Android applicationId/namespace/Kotlin package and component declarations; iOS main, test and extension bundle IDs/signing; Dart package imports if renamed; native/Dart method-channel names if changed. Inspect deep links, app groups, keychain access groups, Firebase/OAuth/push configuration, store identities and persisted data dependencies before altering those contracts. Report external configuration that cannot be verified. Changing an OS app ID generally creates a separate installation; do not imply existing data migrates automatically.

Reuse or adapt the project's deterministic asset generation. Keep editable artwork separate from generated native assets and provide one documented regeneration command. Do not copy a generator that hard-codes another app's paths or geometry unchanged. Preserve platform-required PNG/catalog formats even when the editable source is SVG.

Read [platform implementation](references/platform-implementation.md) for the selected platforms before editing their resources. Keep icon silhouettes recognizable across appearances and inspect outputs at actual icon sizes.

## Use one launch surface

Keep the existing native splash while required initial startup work resolves. Do not add a second full-page Flutter logo, spinner, or theme-specific route merely to cover initialization. Reuse the existing startup coordinator/controller and the installed splash package's preserve/remove mechanism when applicable. Release the splash on completion, including handled failure paths, so recovery UI can appear. Do not add artificial delays.

If initial location permission belongs to startup, let its existing owner perform the check/request under the native splash; show the normal themed recovery UI after a resolved denial or service failure. Resume checks should follow existing screen behavior, not restart a splash route. Permission re-request policy is a separate behavior change: inspect native/plugin status mappings and authorization before modifying it. Do not hard-code an Allow Once expiration duration.

Use one ordinary recovery/page widget with theme colors rather than separate light and dark screens. Match native background, actual host window/view where necessary, and first Flutter frame. Verify the installed Flutter embedder before assuming that changing Main.storyboard changes its live rendering view.

## Verify and deliver

- Inspect the built artifact, not just source configuration: identity, selected icon catalog, launch resource mapping, appearance variants and target membership.
- Run the destination's relevant build/analysis and focused existing tests. Add tests according to its rules and the user's authorization; avoid mirroring generated files with trivial tests.
- Confirm the exact installed bundle/package and version. A separately named test app proves only its own behavior. Keep user observations distinct from your test observations.
- On each requested platform, check the home-screen icon, cold launch in light/dark, native-to-first-page transition, and any affected permission/recovery flow. Distinguish cold launch from returning to a running app. Android launcher icon appearance and iOS home-screen icon styling can be controlled separately from app UI theme.
- If an old logo or white flash persists, read [launch diagnostics](references/launch-diagnostics.md) before another speculative code edit.

Report what changed, regeneration command, verification evidence, and untested platforms. Preserve local data during ordinary upgrades. Rebooting, deleting an app, copying private app data, changing external identities or installing diagnostic copies needs authorization appropriate to the actual action; use existing authorization where applicable. Clean up temporary probes and identify the real app when returning it to the user. Follow the destination's documentation and commit workflow; do not include unrelated changes.

For transferring this skill to another project, see [transfer instructions](TRANSFER.md).
