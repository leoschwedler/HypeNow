import 'package:flutter/material.dart';

/// Sistema de tipografia do app com estilos consistentes
class AppTypography {
  // Família de fontes
  static const String fontFamily = 'Inter';
  static const String fontFamilyFallback = 'Roboto';

  // Pesos de fonte
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Tamanhos de fonte
  static const double xs = 12.0;
  static const double sm = 14.0;
  static const double base = 16.0;
  static const double lg = 18.0;
  static const double xl = 20.0;
  static const double xl2 = 24.0;
  static const double xl3 = 30.0;
  static const double xl4 = 36.0;
  static const double xl5 = 48.0;
  static const double xl6 = 60.0;

  // Alturas de linha
  static const double leadingNone = 1.0;
  static const double leadingTight = 1.25;
  static const double leadingSnug = 1.375;
  static const double leadingNormal = 1.5;
  static const double leadingRelaxed = 1.625;
  static const double leadingLoose = 2.0;

  // Estilos de texto predefinidos
  static const TextStyle displayLarge = TextStyle(
    fontSize: xl6,
    fontWeight: extraBold,
    height: leadingTight,
    letterSpacing: -0.02,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: xl5,
    fontWeight: extraBold,
    height: leadingTight,
    letterSpacing: -0.02,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: xl4,
    fontWeight: extraBold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: xl3,
    fontWeight: bold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: xl2,
    fontWeight: bold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: xl,
    fontWeight: bold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: lg,
    fontWeight: semiBold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: base,
    fontWeight: semiBold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: sm,
    fontWeight: semiBold,
    height: leadingTight,
    letterSpacing: -0.01,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: lg,
    fontWeight: regular,
    height: leadingRelaxed,
    letterSpacing: 0.0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: base,
    fontWeight: regular,
    height: leadingRelaxed,
    letterSpacing: 0.0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: sm,
    fontWeight: regular,
    height: leadingRelaxed,
    letterSpacing: 0.0,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: base,
    fontWeight: medium,
    height: leadingTight,
    letterSpacing: 0.01,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: sm,
    fontWeight: medium,
    height: leadingTight,
    letterSpacing: 0.01,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: xs,
    fontWeight: medium,
    height: leadingTight,
    letterSpacing: 0.01,
  );

  // Estilos específicos para botões
  static const TextStyle buttonLarge = TextStyle(
    fontSize: base,
    fontWeight: semiBold,
    height: leadingTight,
    letterSpacing: 0.01,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: sm,
    fontWeight: semiBold,
    height: leadingTight,
    letterSpacing: 0.01,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: xs,
    fontWeight: semiBold,
    height: leadingTight,
    letterSpacing: 0.01,
  );
}
