# Platform implementation

Use the destination's SDK/package versions and active build configuration. These are workflow checks, not a fixed template to paste into every Apollo fork.

## iOS

- Inspect all shipping target configurations for the selected app-icon catalog. Use the project's chosen asset-catalog or Icon Composer pipeline. Avoid accidentally shipping a different catalog while editing an unused icon source.
- For an asset-catalog workflow, provide the supported Any/Light, Dark and Tinted variants according to the deployment target and current Xcode requirements. Keep normal icon artwork square and let iOS apply the home-screen shape. Treat splash artwork separately: a rounded badge drawn inside a splash image is a deliberate design choice, not a requirement for the app-icon file. Verify alpha/background requirements for the selected appearance; do not blindly flatten every variant.
- Keep one native launch storyboard with an initial view controller and assets from the target's catalog. UILaunchStoryboardName, Xcode resource membership and compiled storyboard name must agree, including case. Use light/dark image variants and a named color with light/dark appearances. Check background colors of the root view, any image background, and actual window/host view; avoid fixed white surfaces behind a dark splash.
- Use stable project-specific resource names where legacy names collide. Update references and regeneration together. Renaming resources is not a universal cache-reset mechanism. Clean stale compiled resources from build output instead of repeatedly renaming production files.
- Native launch is static. Flutter/native startup code owns readiness; no application code runs inside the system's launch snapshot. In Flutter versions that replace the storyboard root view, inspect the live FlutterViewController/window background if a handoff flash is reproduced. Adapt AppDelegate or scene lifecycle only where the actual embedder requires it.
- If adopting a plist-based launch configuration, verify supported OS versions and the Flutter embedder's splash-loading path first. Do not add conflicting launch mechanisms to paper over a stale snapshot.

References: [Apple app-icon catalogs](https://developer.apple.com/documentation/xcode/configuring-your-app-icon), [Flutter iOS launch screens](https://docs.flutter.dev/platform-integration/ios/launch-screen), [Apple launch-screen diagnostics](https://developer.apple.com/documentation/technotes/tn3118-debugging-your-apps-launch-screen).

## Android

- Inspect application/activity labels, launcher icon and roundIcon references, source-set/flavor overrides and selected launch/normal themes.
- Generate legacy density assets where supported; use adaptive foreground/background layers for API 26+ and a monochrome layer for supported themed launchers. Respect the adaptive safe area and system mask. Night resources can supply alternatives but do not guarantee that every launcher immediately refreshes its cached icon.
- Configure pre-Android-12 launch backgrounds and Android 12+ splash attributes separately. Keep light/dark colors consistent in the applicable values, values-night, values-v31 and values-night-v31 resource configurations. Inspect merged resources; an old flavor or qualifier may override the intended theme.
- Android 12+ applies a system splash and its own icon layout/mask. Follow current platform/generator dimensions rather than reusing a full-screen illustration as the splash icon. Match the post-splash normal theme and Flutter first frame to the selected background.
- Avoid introducing a dedicated splash Activity or second Flutter splash page. Keep permission dialogs and handled startup failures in the normal initialization/recovery flow.

References: [Android splash screens](https://developer.android.com/develop/ui/views/launch/splash-screen), [adaptive icons](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive).

## Generator integration

If flutter_native_splash is already used, configure light/dark image and color inputs plus the android_12 block supported by that version. Verify iOS content mode and Android positioning against the design. Preserve its startup handoff API where needed.

If custom named colors/resource names are applied after generation, put that transformation in a reproducible wrapper and document that wrapper as the regeneration command. Run it twice and check for drift. Do not rely on manual generated-file edits that the next run erases. Do not introduce a new generator dependency solely because this skill mentions one.

Reference: [flutter_native_splash source and documentation](https://github.com/jonbhanson/flutter_native_splash).
