<<<<<<< HEAD
// rider_app/lib/core/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // ─── BLUE SECTION ──────────────────────────────────────────────
  static const Color deepBlue = Color(0xFF01288D);
  static const Color royalBlue = Color(0xFF0144C6);
  static const Color brightBlue = Color(0xFF1E6DFF);

  // ─── ORANGE/GOLD SECTION ──────────────────────────────────────
  static const Color darkOrange = Color(0xFFE76601);
  static const Color goldenOrange = Color(0xFFFFA801);
  static const Color brightGold = Color(0xFFFFC233);

  // ─── GRADIENTS ─────────────────────────────────────────────────
  static const LinearGradient blueGradient = LinearGradient(
    colors: [deepBlue, royalBlue, brightBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [darkOrange, goldenOrange, brightGold],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [deepBlue, royalBlue, goldenOrange, brightGold],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.3, 0.7, 1.0],
  );

  // ─── SURFACE COLORS ────────────────────────────────────────────
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A2421);
  static const Color textSecondary = Color(0xFF63736B);
  static const Color borderAccent = Color(0xFFE2E8F0);
=======
import 'package:flutter/material.dart';

class AppColors {
  // Primary Blue
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFF60A5FA);
  
  // Amber
  static const Color amber = Color(0xFFF59E0B);
  static const Color amberLight = Color(0xFFFBBF24);
  static const Color amberDark = Color(0xFFD97706);
  
  // Gradients
  static const LinearGradient amberGradient = LinearGradient(
    colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
}