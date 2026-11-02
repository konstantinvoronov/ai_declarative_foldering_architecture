# Diagnose old logos and white launch transitions

## Separate the surfaces

Identify whether the defect occurs in the system launch image, the native surface kept during initialization, the first Flutter frame, or the background/resume snapshot. Ask for a short recording when necessary; inspect the earliest affected frames. A correct logo visible later does not prove the first system image was correct. A warm return may show a different snapshot than a cold start.

Check the exact installed bundle ID/version and selected scheme/flavor. Multiple Apollo-derived apps may coexist, but do not contradict the user's identification based only on that possibility.

## Establish artifact correctness first

Inspect the built Info.plist/Android manifest and packaged resources. Check target membership, storyboard entry point, image names, color appearances, theme qualifiers, old build output, and actual live-view background only where relevant. Use clean output when stale files are suspected. Rebuild and install the intended artifact in place before considering destructive measures.

On an authorized connected Apple device, Xcode devicectl can copy only Library/SplashBoard from the named appDataContainer for inspection. Discover the device ID; use the installed tool's help for exact syntax. Decode available KTX images with sips and inspect portrait/landscape and appearance variants. Paths and formats are OS-dependent. Snapshots may include captured app content: keep them local and read only what the investigation needs. This is not permission to export recordings, preferences or the entire application container.

A uniformly light image without a logo is different from a correct light-theme image. A newly generated dark snapshot is useful evidence, but still require direct cold-launch acceptance before claiming the transition is fixed. Do not replace system snapshots with hand-painted files or add private cache APIs to production code.

## Refresh based on evidence

When artifacts are correct but device images are stale, use the least disruptive authorized refresh and compare evidence afterward. A device reboot followed by reinstalling the same build in place refreshed the snapshots in the verified case below. This is a troubleshooting option, not a guaranteed platform contract; do not reboot routinely.

Apple TN3118 also describes cleaning build output and removing/reinstalling the app. Removal can delete data. Explain that consequence and use existing explicit authorization or request it. Data backup/export has its own destination and privacy implications; obtain appropriate authorization separately. If approval is rejected, report it and do not route around it. Stop repeating unchanged resets after a failed attempt; inspect what actually changed or seek new evidence.

Temporary native/full-app probes can isolate packaged resources or an app identity's launch state when the extra installation is authorized. Label them clearly, compare the relevant OS version, preserve the real app, and remove probes afterward. Their success is not acceptance of the original installation.

## Verified Apollo-derived case

On 2026-10-29, TrailTelling on iPhone 13 Pro/iOS 18.3.1 showed a blank light system image followed by the correct dark native splash. Build 4 already contained valid themed resources. Native and full-app probes generated correct light/dark images; the original installation still held blank light images. Reboot alone did not resolve it. Reinstalling the same build over the original installation after that reboot regenerated its themed launch images without deleting its data. The user then confirmed a full-close/home-screen launch opened correctly.

This establishes that stale launch images caused the observed transition in that installation. It does not establish that every white flash is a cache issue, that every earlier background-color change was necessary, or that reinstalling alone always works. Preserve the distinction between source correctness, generated-image evidence and user-observed behavior.

Sources: [Apple TN3118](https://developer.apple.com/documentation/technotes/tn3118-debugging-your-apps-launch-screen), [flutter_native_splash troubleshooting](https://github.com/jonbhanson/flutter_native_splash#notes).
