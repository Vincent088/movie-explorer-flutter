import 'package:flutter/material.dart';

class AppTheme {
  static const accent = Color(0xFFE50914);

  static const darkBackground = Color(0xFF000000);
  static const darkSurface = Color(0xFF1A1A1A);
  static const darkSurfaceAlt = Color(0xFF2A2A2A);

  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF0F0F0);
  static const lightSurfaceAlt = Color(0xFFE0E0E0);

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(primary: accent, surface: darkSurface, onSurface: Colors.white),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      useMaterial3: true,
    );
  }

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(primary: accent, surface: lightSurface, onSurface: Colors.black),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      useMaterial3: true,
    );
  }
}

Color getRatingColor(double rating) {
  if (rating >= 7) return const Color(0xFF27AE60);
  if (rating >= 5) return const Color(0xFFF39C12);
  return const Color(0xFFE50914);
}

extension AppColorScheme on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get surfaceAlt => isDarkMode ? AppTheme.darkSurfaceAlt : AppTheme.lightSurfaceAlt;

  Color get mutedText => isDarkMode ? const Color(0xFF888888) : const Color(0xFF666666);
}
