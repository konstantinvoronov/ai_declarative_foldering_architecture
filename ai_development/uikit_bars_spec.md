# UIKit bars

Source request: “lets take AppScreenBar from apollo and adopt BottomsheetAppBar from meetpay.”

## Ownership and public components

Both components are reusable concrete widgets in library-wide Core Presentation.
They are directly importable from `lib/libs/uikit/core/presentation/widgets` by
permitted Presentation consumers. They render headers and dispatch UI actions;
business decisions and application routing policy remain with callers.

| Component | Local reference | Destination |
| --- | --- | --- |
| `AppScreenBar` | `apollo1/lib/libs/uikit/core/presentation/widgets/app_bar.dart` | `lib/libs/uikit/core/presentation/widgets/app_screen_bar.dart` |
| `BottomSheetAppBar` | `meetpay-app/lib/screens/widgets/bottom_sheet/app_bar_dialog.dart` | `lib/libs/uikit/core/presentation/widgets/bottom_sheet_app_bar.dart` |

References are the local working-tree sources inspected on 2026-11-15, rather
than pinned upstream releases. No Figma reference was supplied.

## AppScreenBar

- Implements `PreferredSizeWidget` for use in `Scaffold.appBar`.
- Accepts a widget title, custom leading widget, actions, flexible background,
  background color, toolbar height, and shape.
- Centers the title, uses 15 logical pixels of outer button padding, and removes
  normal and scrolled-under elevation.
- Provides `grayRounded`, `roundedSemiTransparent`, `semiTransparent`, and
  `noReturn`. Factory names use Dart lower camel case.
- Uses a 70 logical pixel toolbar, or 77 for `roundedSemiTransparent`, with a
  30 logical pixel bottom radius for rounded variants.
- The base background is transparent. A null background uses the current
  Material `surfaceContainer`; themed variants use that value. The inherited
  semitransparent variant names do not promise an alpha value: Apollo also
  supplies opaque theme colors for them.
- A supplied leading widget takes precedence. Otherwise the back visibility
  flag controls a standard Flutter back button. The optional callback overrides
  its normal Navigator back behavior.

## BottomSheetAppBar

- Retains Meetpay's `text`, `backButtonTap`, `actions`, and `paddings` inputs.
- Uses a 56 logical pixel toolbar and default horizontal padding of 15.
- Centers a single-line title using the current Material title style. Flutter's
  toolbar layout constrains long titles between the buttons and ellipsizes them.
- Shows an animated back button only when a back callback is supplied.
- A null action list supplies a close button that requests light haptic feedback
  and pops the surrounding Navigator. An explicit action list replaces it;
  an empty list hides it. Use in a modal route, or supply caller-owned actions
  when no Navigator dismissal is appropriate.

## Adaptation boundaries

Only Flutter SDK imports are needed. Apollo's DI, router, generated SVG assets,
`AppElement`, sizing initialization, and theme/button classes are absent in this
blueprint. Standard Material controls and theme values replace those integrations;
custom screen leading widgets and sheet actions remain injectable.

Unused Apollo back-button styling fields are not copied. The source's ignored
back visibility and background parameters are applied through the destination's
working controls and background. The rounded background is rendered by AppBar's
shape instead of an externally calculated status-bar-sized container.

Localization belongs to callers. Sheet text honors Flutter text scaling rather
than Meetpay's forced unscaled title. These are functional adaptations, not
pixel-identical copies of either application's branded design.

## Verification and diagnostics

Run formatting, static analysis of the new components, and the existing Flutter
test suite. Review title, button, variant, and navigation behavior against this
specification. The existing counter test is an application smoke test and does
not exercise these new headers. No device or visual acceptance is implied.

These stateless rendering components emit no diagnostic logs. Their appearance,
callback invocation, and dismissal cannot be established from device logs alone;
verify them through UI interaction in the consuming application. No runtime
instrumentation is added solely for logging.
