import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/theme/app_typography.dart';

class SplashTitle extends StatelessWidget {
  final String text;

  const SplashTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      text,
      style: AppTypography.displayMedium.copyWith(
        color: colorScheme.primary,
        fontWeight: AppTypography.extraBold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
