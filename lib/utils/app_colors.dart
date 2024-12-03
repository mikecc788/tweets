import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  // SUI Theme Colors
  static Color get primary => const Color(0xFF0064FA); // SUI Blue
  static Color get primaryLight => const Color(0xFF339DFF);
  static Color get primaryDark => const Color(0xFF0052CC);

  // Background Colors
  static Color get background => const Color(0xFFFFFFFF);
  static Color get backgroundDark => const Color(0xFF1C1C1E);
  static Color get backgroundGrey => const Color(0xFFF5F5F5);
  static Color get surfaceColor => const Color(0xFFF8F9FC);

  static Color get topBgColor => const Color(0xFF121212);
  // Text Colors
  static Color get textPrimary => const Color(0xFF1C1C1E);
  static Color get textSecondary => const Color(0xFF8E8E93);
  static Color get textLight => const Color(0xFFFFFFFF);
  static Color get textGrey => const Color(0xFFC7C7CC);

  // Accent Colors
  static Color get accentBlue => const Color(0xFF0064FA);
  static Color get accentGreen => const Color(0xFF34C759);
  static Color get accentYellow => const Color(0xFFFFCC00);
  static Color get accentRed => const Color(0xFFFF3B30);

  // Border Colors
  static Color get border => const Color(0xFFE5E5EA);
  static Color get borderLight => const Color(0xFFF2F2F7);

  // Status Colors
  static Color get success => const Color(0xFF34C759);
  static Color get warning => const Color(0xFFFFCC00);
  static Color get error => const Color(0xFFFF3B30);
  static Color get info => const Color(0xFF0064FA);

  // Gradients
  static List<Color> get primaryGradient => [
        const Color(0xFF0064FA),
        const Color(0xFF339DFF),
      ];

  static List<Color> get blueGradient => [
        const Color(0xFF0064FA),
        const Color(0xFF0052CC),
      ];

  // Dark Mode Check
  static final _isDarkMode = Get.isDarkMode;
  static Color blackWithAlpha(double alpha) {
    return Color.fromRGBO(0, 0, 0, alpha);
  }

  // Common black opacity values
  static Color get blackOpacity10 => blackWithAlpha(0.1);
  static Color get blackOpacity40 => blackWithAlpha(0.4);
  static Color get blackOpacity60 => blackWithAlpha(0.6);

  // 获取主题相关颜色
  static Color get scaffoldBackground =>
      _isDarkMode ? backgroundDark : background;

  static Color get textColor => _isDarkMode ? textLight : textPrimary;

  static Color get textColorSecondary => _isDarkMode ? textGrey : textSecondary;

  // Material 调色板
  static MaterialColor get primarySwatch => MaterialColor(
        primary.value,
        <int, Color>{
          50: primary.withOpacity(0.1),
          100: primary.withOpacity(0.2),
          200: primary.withOpacity(0.3),
          300: primary.withOpacity(0.4),
          400: primary.withOpacity(0.5),
          500: primary.withOpacity(0.6),
          600: primary.withOpacity(0.7),
          700: primary.withOpacity(0.8),
          800: primary.withOpacity(0.9),
          900: primary,
        },
      );

  // 主题数据
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: scaffoldBackground,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: primary,
          foregroundColor: textLight,
          elevation: 0,
        ),
        colorScheme: ColorScheme.light(
          primary: primary,
          secondary: accentGreen,
          surface: surfaceColor,
          background: backgroundGrey,
          error: error,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: textColor),
          displayMedium: TextStyle(color: textColor),
          displaySmall: TextStyle(color: textColor),
          headlineMedium: TextStyle(color: textColor),
          headlineSmall: TextStyle(color: textColor),
          titleLarge: TextStyle(color: textColor),
          bodyLarge: TextStyle(color: textColor),
          bodyMedium: TextStyle(color: textColorSecondary),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: backgroundDark,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundDark,
          foregroundColor: textLight,
          elevation: 0,
        ),
        colorScheme: ColorScheme.dark(
          primary: primary,
          secondary: accentGreen,
          surface: backgroundDark,
          background: backgroundDark,
          error: error,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: textLight),
          displayMedium: TextStyle(color: textLight),
          displaySmall: TextStyle(color: textLight),
          headlineMedium: TextStyle(color: textLight),
          headlineSmall: TextStyle(color: textLight),
          titleLarge: TextStyle(color: textLight),
          bodyLarge: TextStyle(color: textLight),
          bodyMedium: TextStyle(color: textGrey),
        ),
      );
}
