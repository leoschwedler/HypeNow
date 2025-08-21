import 'package:flutter/material.dart';

class WelcomeController extends ChangeNotifier {
  late final AnimationController controller;
  late final Animation<double> fadeLogo;
  late final Animation<Offset> slideLogo;
  late final Animation<double> fadeTitle;
  late final Animation<Offset> slideTitle;
  late final Animation<double> fadeButtons;
  late final Animation<Offset> slideButtons;

  void initializeAnimations(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 900),
    );

    _setupAnimations();
    controller.forward();
  }

  void _setupAnimations() {
    fadeLogo = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );

    slideLogo = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );

    fadeTitle = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.25, 0.75, curve: Curves.easeOut),
    );

    slideTitle = Tween<Offset>(
      begin: const Offset(0, 0.10),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.75, curve: Curves.easeOutCubic),
      ),
    );

    fadeButtons = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    slideButtons = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
