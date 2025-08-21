import 'package:flutter/material.dart';

/// Cores base do app que podem ser usadas em ambos os temas
class AppColors {
  // Cores primárias
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Cores secundárias
  static const Color secondary = Color(0xFF10B981);
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);

  // Cores de acento
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFD97706);

  // Cores de erro e sucesso
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Cores neutras
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFE5E5E5);
  static const Color neutral300 = Color(0xFFD4D4D4);
  static const Color neutral400 = Color(0xFFA3A3A3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);
  static const Color neutral950 = Color(0xFF0A0A0A);
}

/// Cores específicas para o tema claro
class LightColors {
  // Cores de fundo
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFAFAFA);
  static const Color card = Color(0xFFFFFFFF);

  // Cores de texto
  static const Color textPrimary = Color(0xFF171717);
  static const Color textSecondary = Color(0xFF525252);
  static const Color textTertiary = Color(0xFF737373);
  static const Color textInverse = Color(0xFFFFFFFF);

  // Cores de borda e divisão
  static const Color border = Color(0xFFE5E5E5);
  static const Color divider = Color(0xFFF5F5F5);

  // Cores de sombra
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0A000000);
}

/// Cores específicas para o tema escuro
class DarkColors {
  // Cores de fundo
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF171717);
  static const Color card = Color(0xFF262626);

  // Cores de texto
  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFFD4D4D4);
  static const Color textTertiary = Color(0xFFA3A3A3);
  static const Color textInverse = Color(0xFF171717);

  // Cores de borda e divisão
  static const Color border = Color(0xFF404040);
  static const Color divider = Color(0xFF262626);

  // Cores de sombra
  static const Color shadow = Color(0x40000000);
  static const Color shadowLight = Color(0x20000000);
}
