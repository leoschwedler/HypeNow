import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/theme/app_typography.dart';

class SplashSubtitle extends StatelessWidget {
  final String text;

  const SplashSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      text,
      style: AppTypography.bodyLarge.copyWith(
        color: colorScheme.onSurface.withOpacity(0.7),
        fontWeight: AppTypography.medium,
      ),
      textAlign: TextAlign.center,
    );
  }
}
