import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// GroundSeva "Forest Sentinel" Design System
/// Based on Stitch-generated eco-green dark forest theme
class AppTheme {
  // ─── SURFACE HIERARCHY (Dark Forest Layers) ───
  static const Color surface = Color(0xFF03170D);
  static const Color surfaceDim = Color(0xFF03170D);
  static const Color surfaceContainerLowest = Color(0xFF001208);
  static const Color surfaceContainerLow = Color(0xFF0B1F14);
  static const Color surfaceContainer = Color(0xFF0F2418);
  static const Color surfaceContainerHigh = Color(0xFF192E22);
  static const Color surfaceContainerHighest = Color(0xFF24392D);
  static const Color surfaceBright = Color(0xFF293E31);
  static const Color surfaceVariant = Color(0xFF24392D);

  // ─── PRIMARY (Radiant Green) ───
  static const Color primary = Color(0xFF63DD98);
  static const Color primaryContainer = Color(0xFF1CA566);
  static const Color primaryFixed = Color(0xFF80FAB3);
  static const Color primaryFixedDim = Color(0xFF63DD98);
  static const Color onPrimary = Color(0xFF00391F);
  static const Color onPrimaryContainer = Color(0xFF00311A);

  // ─── SECONDARY (Lush Green) ───
  static const Color secondary = Color(0xFF88D982);
  static const Color secondaryContainer = Color(0xFF005B14);
  static const Color onSecondary = Color(0xFF003909);
  static const Color onSecondaryContainer = Color(0xFF81D27C);

  // ─── TERTIARY (Soft Growth) ───
  static const Color tertiary = Color(0xFF90D792);
  static const Color tertiaryContainer = Color(0xFF5CA061);
  static const Color onTertiary = Color(0xFF003911);

  // ─── ON SURFACE ───
  static const Color onSurface = Color(0xFFD0E9D6);
  static const Color onSurfaceVariant = Color(0xFFBCCABE);
  static const Color outline = Color(0xFF879489);
  static const Color outlineVariant = Color(0xFF3D4A40);

  // ─── ERROR / DANGER ───
  static const Color error = Color(0xFFFFB4AB);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color danger = Color(0xFFEF4444);

  // ─── FUNCTIONAL ACCENTS ───
  static const Color earningGold = Color(0xFFFBBF24);
  static const Color warningAmber = Color(0xFFF59E0B);
  static const Color infoBlue = Color(0xFF3B82F6);
  static const Color sosDanger = Color(0xFFDC2626);

  // ─── INVERSE ───
  static const Color inverseSurface = Color(0xFFD0E9D6);
  static const Color inversePrimary = Color(0xFF006D40);
  static const Color inverseOnSurface = Color(0xFF203529);

  // ─── GRADIENTS ───
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF63DD98), Color(0xFF1CA566), Color(0xFF006D40)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient surfaceGradient = LinearGradient(
    colors: [surfaceContainerLow, surface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient dangerGradient = LinearGradient(
    colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ─── GLASSMORPHISM HELPERS ───
  static BoxDecoration glassCard({Color? tint, double opacity = 0.12, double radius = 20}) {
    return BoxDecoration(
      color: (tint ?? surfaceVariant).withAlpha((opacity * 255).round()),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: outlineVariant.withAlpha(40), width: 1),
    );
  }

  static BoxDecoration glowCard({Color? color, double radius = 20}) {
    final c = color ?? primary;
    return BoxDecoration(
      color: surfaceContainerHigh,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: c.withAlpha(60), width: 1.5),
      boxShadow: [
        BoxShadow(color: c.withAlpha(30), blurRadius: 24, spreadRadius: -4),
      ],
    );
  }

  // ─── THEME DATA ───
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: surface,
      colorScheme: const ColorScheme.dark(
        surface: surface,
        primary: primary,
        primaryContainer: primaryContainer,
        secondary: secondary,
        secondaryContainer: secondaryContainer,
        tertiary: tertiary,
        tertiaryContainer: tertiaryContainer,
        error: error,
        errorContainer: errorContainer,
        onSurface: onSurface,
        onPrimary: onPrimary,
        onPrimaryContainer: onPrimaryContainer,
        onSecondary: onSecondary,
        onSecondaryContainer: onSecondaryContainer,
        onTertiary: onTertiary,
        onError: Color(0xFF690005),
        outline: outline,
        outlineVariant: outlineVariant,
        surfaceContainerHighest: surfaceContainerHighest,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: onSurface, displayColor: onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceContainerLow,
        foregroundColor: onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 20, fontWeight: FontWeight.w700, color: onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceContainerHigh,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceContainerLow,
        selectedItemColor: primary,
        unselectedItemColor: outline,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryContainer,
          foregroundColor: onPrimaryContainer,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          textStyle: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: TextStyle(color: outline.withAlpha(150)),
      ),
      dividerTheme: const DividerThemeData(color: outlineVariant, thickness: 0.5),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceContainerHigh,
        selectedColor: primaryContainer,
        labelStyle: GoogleFonts.plusJakartaSans(fontSize: 13, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        side: BorderSide(color: outlineVariant.withAlpha(80)),
      ),
    );
  }
}
