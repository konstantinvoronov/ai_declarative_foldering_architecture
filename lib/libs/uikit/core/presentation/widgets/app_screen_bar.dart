import 'package:flutter/material.dart';

/// SRP: renders a screen header with a title, leading button, and actions.
class AppScreenBar extends StatelessWidget implements PreferredSizeWidget {
  const AppScreenBar({
    super.key,
    this.title,
    this.leadingButton,
    required this.isBackButtonVisible,
    this.onBackPressed,
    this.backgroundColor = Colors.transparent,
    this.flexibleSpace,
    this.height = 70,
    this.actions,
    this.shape,
  });

  factory AppScreenBar.grayRounded({
    Widget? title,
    Widget? leadingButton,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
  }) {
    return AppScreenBar(
      title: title,
      leadingButton: leadingButton,
      isBackButtonVisible: true,
      onBackPressed: onBackPressed,
      backgroundColor: null,
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
    );
  }

  factory AppScreenBar.roundedSemiTransparent({
    Widget? title,
    Widget? leadingButton,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
  }) {
    return AppScreenBar(
      title: title,
      leadingButton: leadingButton,
      isBackButtonVisible: true,
      onBackPressed: onBackPressed,
      backgroundColor: null,
      height: 77,
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
    );
  }

  factory AppScreenBar.semiTransparent({
    Widget? title,
    Widget? leadingButton,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
  }) {
    return AppScreenBar(
      title: title,
      leadingButton: leadingButton,
      isBackButtonVisible: true,
      onBackPressed: onBackPressed,
      backgroundColor: null,
      actions: actions,
    );
  }

  factory AppScreenBar.noReturn({Widget? title}) {
    return AppScreenBar(title: title, isBackButtonVisible: false);
  }

  final Widget? title;
  final Widget? leadingButton;
  final bool isBackButtonVisible;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final double height;
  final List<Widget>? actions;
  final ShapeBorder? shape;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final leading =
        leadingButton ??
        (isBackButtonVisible ? BackButton(onPressed: onBackPressed) : null);

    return AppBar(
      title: title,
      toolbarHeight: height,
      flexibleSpace: flexibleSpace,
      leading: leading == null
          ? null
          : Padding(
              padding: const EdgeInsetsDirectional.only(start: 15),
              child: Center(child: leading),
            ),
      leadingWidth: 63,
      automaticallyImplyLeading: false,
      actions: actions == null
          ? null
          : [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 15),
                child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
              ),
            ],
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      shape: shape,
      clipBehavior: Clip.antiAlias,
    );
  }
}
