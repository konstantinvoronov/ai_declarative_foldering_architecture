import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// SRP: renders a sheet header with a title, optional back button, and actions.
class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({
    super.key,
    this.text,
    this.backButtonTap,
    this.actions,
    this.paddings,
  });

  final String? text;
  final VoidCallback? backButtonTap;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? paddings;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56),
      child: Padding(
        padding: paddings ?? const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: 56,
          child: NavigationToolbar(
            centerMiddle: true,
            middleSpacing: 10,
            leading: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: backButtonTap == null
                  ? const SizedBox(width: 48)
                  : BackButton(onPressed: backButtonTap),
            ),
            middle: Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children:
                  actions ??
                  [
                    CloseButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
