import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Standardized spacing tokens based on the fluid grid model.
class AppSpacing {
  static const double xs = 4.0;
  static const double base = 8.0;
  static const double sm = 12.0;
  static const double md = 20.0;
  static const double lg = 32.0;
  static const double xl = 48.0;
  static const double touchTarget = 56.0;
  static const double marginMobile = 24.0;
}

/// Standardized border radii for the rounded shape philosophy.
class AppRadius {
  static const BorderRadius sm = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius standard = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius md = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(24.0));
  static const BorderRadius full = BorderRadius.all(Radius.circular(9999.0));
}

/// The core design system and Material 3 theme for Smart Grocery.
class AppTheme {
  /// Defines the light color scheme based on soft neutrals and pastel accents.
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3A6758),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFA7D7C5),
    onPrimaryContainer: Color(0xFF325F51),
    secondary: Color(0xFF486270),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCBE6F8),
    onSecondaryContainer: Color(0xFF4E6877),
    tertiary: Color(0xFF6D595B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE1C7C9),
    onTertiaryContainer: Color(0xFF655254),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
    surface: Color(0xFFF8F9FA),
    onSurface: Color(0xFF191C1D),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF3F4F5),
    surfaceContainer: Color(0xFFEDEEEF),
    surfaceContainerHigh: Color(0xFFE7E8E9),
    surfaceContainerHighest: Color(0xFFE1E3E4),
    onSurfaceVariant: Color(0xFF404945),
    outline: Color(0xFF717975),
    outlineVariant: Color(0xFFC0C8C3),
    inverseSurface: Color(0xFF2E3132),
    onInverseSurface: Color(0xFFF0F1F2),
    inversePrimary: Color(0xFFA1D1BF),
    surfaceTint: Color(0xFF3A6758),
  );

  /// Builds the Plus Jakarta Sans text theme.
  static TextTheme _buildTextTheme() {
    return GoogleFonts.plusJakartaSansTextTheme().copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 40 / 30,
        letterSpacing: -0.6,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
        letterSpacing: -0.24,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 28 / 18,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      ),
      labelLarge: GoogleFonts.plusJakartaSans(
        // Used for buttons
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
      ),
      labelMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.14,
      ),
    );
  }

  /// The complete light theme data to be provided to MaterialApp.
  static ThemeData get lightTheme {
    final textTheme = _buildTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      scaffoldBackgroundColor: _lightColorScheme.surface,
      textTheme: textTheme,

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightColorScheme.primaryContainer,
          foregroundColor: _lightColorScheme.onPrimaryContainer,
          minimumSize: const Size(64, AppSpacing.touchTarget),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.full),
          textStyle: textTheme.labelLarge,
          elevation: 1,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightColorScheme.surfaceContainer,
        hoverColor: _lightColorScheme.surface,
        focusColor: _lightColorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.standard,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.standard,
          borderSide: BorderSide.none,
        ),
        labelStyle: textTheme.bodyLarge?.copyWith(
          color: _lightColorScheme.onSurfaceVariant,
        ),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sm),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return _lightColorScheme.primary;
          }
          return _lightColorScheme.surfaceContainerHighest;
        }),
        checkColor: WidgetStateProperty.all(_lightColorScheme.onPrimary),
        splashRadius: 24,
      ),

      // Card Theme (Fixed CardThemeData Error)
      cardTheme: CardThemeData(
        color: _lightColorScheme.surfaceContainerLowest,
        elevation: 1,
        shadowColor: _lightColorScheme.primary.withValues(alpha: 0.08),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lg),
        margin: EdgeInsets.zero,
      ),
    );
  }
}
