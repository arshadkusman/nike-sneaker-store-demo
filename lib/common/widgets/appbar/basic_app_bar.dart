import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color titleColor;
  final TextStyle? titleStyle;
  final double? leadingIconSize;
  final VoidCallback? onLeadingIconPressed; // New parameter for onPressed callback

  const BasicAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.actions,
    this.backgroundColor = Colors.transparent,
    this.titleColor = Colors.black,
    this.titleStyle,
    this.leadingIconSize = 26.0,
    this.onLeadingIconPressed, // Initialize the onPressed callback
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              onPressed: onLeadingIconPressed ?? () {}, // Use the provided onPressed or a default no-op
              icon: Icon(leadingIcon, size: leadingIconSize),
            )
          : null,
      actions: actions,
      title: Text(
        title,
        style: titleStyle ??
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: titleColor,
            ),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: titleColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
