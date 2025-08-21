import 'package:flutter/material.dart';

class ThemeToggleButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isDark;
  const ThemeToggleButton({
    super.key,
    required this.onPressed,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return RotationTransition(turns: animation, child: child);
        },
        child: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          key: ValueKey<bool>(isDark),
          color: theme.colorScheme.onSurface,
          size: 24,
        ),
      ),
    );
  }
}
