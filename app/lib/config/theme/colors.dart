import 'package:flutter/material.dart';

/// Constructoken Color Palette
/// This file contains all the color definitions for the Constructoken app.
/// Colors are organized by their usage and include semantic naming.

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1E88E5); // Blue 600
  static const Color primaryLight = Color(0xFF64B5F6); // Blue 300
  static const Color primaryDark = Color(0xFF1565C0); // Blue 800

  // Secondary Colors
  static const Color secondary = Color(0xFF26A69A); // Teal 400
  static const Color secondaryLight = Color(0xFF80CBC4); // Teal 200
  static const Color secondaryDark = Color(0xFF00897B); // Teal 600

  // Neutral Colors
  static const Color background = Color(0xFFF5F5F5); // Grey 100
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color error = Color(0xFFD32F2F); // Red 700

  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Grey 900
  static const Color textSecondary = Color(0xFF757575); // Grey 600
  static const Color textHint = Color(0xFFBDBDBD); // Grey 400

  // Status Colors
  static const Color success = Color(0xFF43A047); // Green 600
  static const Color warning = Color(0xFFFFA000); // Amber 600
  static const Color info = Color(0xFF1E88E5); // Blue 600

  // Semantic Colors
  static const Color divider = Color(0xFFE0E0E0); // Grey 300
  static const Color disabled = Color(0xFFBDBDBD); // Grey 400
  static const Color overlay = Color(0x80000000); // Black with 50% opacity

  // Material Color Swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF1E88E5, // Primary color value
    <int, Color>{
      50: Color(0xFFE3F2FD), // Lightest
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF1E88E5), // Primary
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1), // Darkest
    },
  );
}
