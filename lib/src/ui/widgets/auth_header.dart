import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hype_now/src/ui/controllers/theme_controller.dart';
import 'theme_toggle_button.dart';

class AuthHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const AuthHeader({super.key, this.showBackButton = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final themeController = GetIt.instance<ThemeController>();

    return AppBar(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: false,
      leading:
          showBackButton
              ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => Navigator.of(context).maybePop(),
              )
              : null,

      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: themeController,
          builder: (context, isDark, _) {
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: ThemeToggleButton(
                onPressed: themeController.toggleTheme,
                isDark: isDark,
              ),
            );
          },
        ),
      ],
    );
  }
}
