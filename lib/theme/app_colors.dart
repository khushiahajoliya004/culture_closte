import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primaryMaroon = Color(0xFF951E45);
  static const Color darkTeal = Color(0xFF0F4041);
  static const Color deepTeal = Color(0xFF064041);

  // Text Colors
  static const Color textDark = Color(0xFF0F0D1A);
  static const Color textDarkBrown = Color(0xFF2E2C2C);
  static const Color textBrown = Color(0xFF403D3D);
  static const Color textGray = Color(0xFF787878);
  static const Color textPlaceholder = Color(0xFF7C7C7C);
  static const Color textLight = Color(0xFFB3B3B3);
  static const Color textNavInactive = Color(0xFF1F2024);

  // Background Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color bgLight = Color(0xFFF5F5F5);
  static const Color bgVeryLight = Color(0xFFF1F5F9);
  static const Color bgPinkLight = Color(0xFFFFF2F0);
  static const Color bgPeach = Color(0xFFFFE1CA);
  static const Color bgPeachLight = Color(0xFFFFDEC4);
  static const Color bgPeachMid = Color(0xFFFFBF8E);

  // Border Colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMid = Color(0xFFD7D7D7);
  static const Color borderDark = Color(0xFFD9D9D9);

  // Accent Colors
  static const Color accentOrange = Color(0xFFD57429);
  static const Color accentOrangeAlt = Color(0xFFD47428);
  static const Color accentRed = Color(0xFFD22027);
  static const Color accentCoral = Color(0xFFE17565);

  // Category Card Background
  static const Color categoryCardBg = Color(0xFFADA17F);

  // Onboarding gradient
  static const Color gradientStart = Color(0xFFFFFAF6);
  static const Color gradientEnd = Color(0xFFFFD8B9);

  // Misc
  static const Color blueGray = Color(0xFF97A3B3);
  static const Color blueGrayDark = Color(0xFF475569);
  static const Color divider = Color(0xFFE1E1E5);
  static const Color iconGray = Color(0xFFA7A7A7);

  // Gradient
  static const LinearGradient onboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientStart, gradientEnd],
  );
}
