import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/theme/app_spacing.dart';

class SplashLogo extends StatelessWidget {
  final double size;
  final Color color;

  const SplashLogo({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: AppSpacing.shadowLg,
            offset: const Offset(0, AppSpacing.shadowMd),
          ),
        ],
      ),
      child: Icon(Icons.flash_on, size: size * 0.6, color: Colors.white),
    );
  }
}
