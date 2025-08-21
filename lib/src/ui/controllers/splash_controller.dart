import 'package:flutter/material.dart';

class SplashController {
  late final AnimationController _fadeController;
  late final AnimationController _scaleController;

  late final Animation<double> fadeAnimation;
  late final Animation<double> scaleAnimation;

  void init({
    required TickerProvider vsync,
    Duration fadeDuration = const Duration(milliseconds: 1200),
    Duration scaleDuration = const Duration(milliseconds: 800),
  }) {
    _fadeController = AnimationController(duration: fadeDuration, vsync: vsync);
    _scaleController = AnimationController(
      duration: scaleDuration,
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
  }

  void playAnimations() {
    _fadeController.forward();
    _scaleController.forward();
  }

  void startNavigationTimer({
    Duration delay = const Duration(seconds: 5),
    required VoidCallback onNavigate,
  }) {
    Future.delayed(delay, onNavigate);
  }

  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
  }
}
