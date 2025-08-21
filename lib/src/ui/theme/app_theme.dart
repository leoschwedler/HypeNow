import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';

/// Gerenciador de temas do app
class AppTheme {
  /// Tema claro do app
  static ThemeData get lightTheme {
    return ThemeData(
      // Configurações básicas
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppTypography.fontFamily,

      // Cores do tema
      colorScheme: const ColorScheme.light(
        // Cores primárias
        primary: AppColors.primary,
        onPrimary: LightColors.textInverse,
        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: LightColors.textPrimary,

        // Cores secundárias
        secondary: AppColors.secondary,
        onSecondary: LightColors.textInverse,
        secondaryContainer: AppColors.secondaryLight,
        onSecondaryContainer: LightColors.textPrimary,
        surface: LightColors.surface,
        onSurface: LightColors.textPrimary,
        surfaceContainerHighest: LightColors.card,
        onSurfaceVariant: LightColors.textSecondary,

        // Cores de erro
        error: AppColors.error,
        onError: LightColors.textInverse,
        errorContainer: Color(0xFFFEE2E2),
        onErrorContainer: AppColors.error,

        // Cores de sucesso
        tertiary: AppColors.success,
        onTertiary: LightColors.textInverse,
        tertiaryContainer: Color(0xFFD1FAE5),
        onTertiaryContainer: AppColors.success,

        // Cores de aviso
        outline: LightColors.border,
        outlineVariant: LightColors.divider,
        shadow: LightColors.shadow,
        scrim: LightColors.shadowLight,
      ),

      // Configurações de AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: LightColors.background,
        foregroundColor: LightColors.textPrimary,
        elevation: AppSpacing.elevationNone,
        scrolledUnderElevation: AppSpacing.elevationSm,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: LightColors.textPrimary,
        ),
        iconTheme: IconThemeData(color: LightColors.textPrimary, size: 24.0),
      ),

      // Configurações de Card
      cardTheme: CardTheme(
        color: LightColors.card,
        elevation: AppSpacing.elevationSm,
        shadowColor: LightColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        margin: EdgeInsets.all(AppSpacing.sm),
      ),

      // Configurações de ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: LightColors.textInverse,
          elevation: AppSpacing.elevationSm,
          shadowColor: LightColors.shadow,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.buttonPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Configurações de OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary, width: 1.0),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.buttonPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Configurações de TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Configurações de InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LightColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: LightColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: LightColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: AppColors.error, width: 2.0),
        ),
        contentPadding: EdgeInsets.all(AppSpacing.md),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: LightColors.textSecondary,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: LightColors.textTertiary,
        ),
      ),

      // Configurações de Chip
      chipTheme: ChipThemeData(
        backgroundColor: LightColors.surface,
        selectedColor: AppColors.primary,
        labelStyle: AppTypography.labelMedium,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),

      // Configurações de Divider
      dividerTheme: DividerThemeData(
        color: LightColors.divider,
        thickness: 1.0,
        space: AppSpacing.md,
      ),

      // Configurações de Icon
      iconTheme: IconThemeData(color: LightColors.textSecondary, size: 24.0),

      // Configurações de Text
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: LightColors.textPrimary,
        ),
        displayMedium: AppTypography.displayMedium.copyWith(
          color: LightColors.textPrimary,
        ),
        displaySmall: AppTypography.displaySmall.copyWith(
          color: LightColors.textPrimary,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: LightColors.textPrimary,
        ),
        headlineMedium: AppTypography.headlineMedium.copyWith(
          color: LightColors.textPrimary,
        ),
        headlineSmall: AppTypography.headlineSmall.copyWith(
          color: LightColors.textPrimary,
        ),
        titleLarge: AppTypography.titleLarge.copyWith(
          color: LightColors.textPrimary,
        ),
        titleMedium: AppTypography.titleMedium.copyWith(
          color: LightColors.textPrimary,
        ),
        titleSmall: AppTypography.titleSmall.copyWith(
          color: LightColors.textPrimary,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: LightColors.textPrimary,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: LightColors.textPrimary,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: LightColors.textPrimary,
        ),
        labelLarge: AppTypography.labelLarge.copyWith(
          color: LightColors.textSecondary,
        ),
        labelMedium: AppTypography.labelMedium.copyWith(
          color: LightColors.textSecondary,
        ),
        labelSmall: AppTypography.labelSmall.copyWith(
          color: LightColors.textSecondary,
        ),
      ),
    );
  }

  /// Tema escuro do app
  static ThemeData get darkTheme {
    return ThemeData(
      // Configurações básicas
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppTypography.fontFamily,

      // Cores do tema
      colorScheme: const ColorScheme.dark(
        // Cores primárias
        primary: AppColors.primaryLight,
        onPrimary: DarkColors.textInverse,
        primaryContainer: AppColors.primary,
        onPrimaryContainer: DarkColors.textPrimary,

        // Cores secundárias
        secondary: AppColors.secondaryLight,
        onSecondary: DarkColors.textInverse,
        secondaryContainer: AppColors.secondary,
        onSecondaryContainer: DarkColors.textPrimary,
        surface: DarkColors.surface,
        onSurface: DarkColors.textPrimary,
        surfaceContainerHighest: DarkColors.card,
        onSurfaceVariant: DarkColors.textSecondary,

        // Cores de erro
        error: AppColors.error,
        onError: DarkColors.textInverse,
        errorContainer: Color(0xFF7F1D1D),
        onErrorContainer: Color(0xFFFCA5A5),

        // Cores de sucesso
        tertiary: AppColors.success,
        onTertiary: DarkColors.textInverse,
        tertiaryContainer: Color(0xFF064E3B),
        onTertiaryContainer: Color(0xFF6EE7B7),

        // Cores de aviso
        outline: DarkColors.border,
        outlineVariant: DarkColors.divider,
        shadow: DarkColors.shadow,
        scrim: DarkColors.shadowLight,
      ),

      // Configurações de AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: DarkColors.background,
        foregroundColor: DarkColors.textPrimary,
        elevation: AppSpacing.elevationNone,
        scrolledUnderElevation: AppSpacing.elevationSm,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: DarkColors.textPrimary,
        ),
        iconTheme: IconThemeData(color: DarkColors.textPrimary, size: 24.0),
      ),

      // Configurações de Card
      cardTheme: CardTheme(
        color: DarkColors.card,
        elevation: AppSpacing.elevationSm,
        shadowColor: DarkColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        margin: EdgeInsets.all(AppSpacing.sm),
      ),

      // Configurações de ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: DarkColors.textInverse,
          elevation: AppSpacing.elevationSm,
          shadowColor: DarkColors.shadow,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.buttonPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Configurações de OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: BorderSide(color: AppColors.primaryLight, width: 1.0),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.buttonPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Configurações de TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Configurações de InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DarkColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: DarkColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: DarkColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: AppColors.primaryLight, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: AppColors.error, width: 2.0),
        ),
        contentPadding: EdgeInsets.all(AppSpacing.md),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: DarkColors.textSecondary,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: DarkColors.textTertiary,
        ),
      ),

      // Configurações de Chip
      chipTheme: ChipThemeData(
        backgroundColor: DarkColors.surface,
        selectedColor: AppColors.primaryLight,
        labelStyle: AppTypography.labelMedium,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),

      // Configurações de Divider
      dividerTheme: DividerThemeData(
        color: DarkColors.divider,
        thickness: 1.0,
        space: AppSpacing.md,
      ),

      // Configurações de Icon
      iconTheme: IconThemeData(color: DarkColors.textSecondary, size: 24.0),

      // Configurações de Text
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: DarkColors.textPrimary,
        ),
        displayMedium: AppTypography.displayMedium.copyWith(
          color: DarkColors.textPrimary,
        ),
        displaySmall: AppTypography.displaySmall.copyWith(
          color: DarkColors.textPrimary,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: DarkColors.textPrimary,
        ),
        headlineMedium: AppTypography.headlineMedium.copyWith(
          color: DarkColors.textPrimary,
        ),
        headlineSmall: AppTypography.headlineSmall.copyWith(
          color: DarkColors.textPrimary,
        ),
        titleLarge: AppTypography.titleLarge.copyWith(
          color: DarkColors.textPrimary,
        ),
        titleMedium: AppTypography.titleMedium.copyWith(
          color: DarkColors.textPrimary,
        ),
        titleSmall: AppTypography.titleSmall.copyWith(
          color: DarkColors.textPrimary,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: DarkColors.textPrimary,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: DarkColors.textPrimary,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: DarkColors.textPrimary,
        ),
        labelLarge: AppTypography.labelLarge.copyWith(
          color: DarkColors.textSecondary,
        ),
        labelMedium: AppTypography.labelMedium.copyWith(
          color: DarkColors.textSecondary,
        ),
        labelSmall: AppTypography.labelSmall.copyWith(
          color: DarkColors.textSecondary,
        ),
      ),
    );
  }
}
