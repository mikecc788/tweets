import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  // Google Web Designer 主题色
  static Color get primary => const Color(0xFF1967D2);  // Google Blue
  static Color get primaryLight => const Color(0xFF4285F4);
  static Color get primaryDark => const Color(0xFF185ABC);
  
  // 背景色
  static Color get background => const Color(0xFFFFFFFF);
  static Color get backgroundDark => const Color(0xFF202124);
  static Color get backgroundGrey => const Color(0xFFF8F9FA);
  static Color get surfaceColor => const Color(0xFFE8F0FE);  // 浅蓝色背景
  
  // 文字颜色
  static Color get textPrimary => const Color(0xFF202124);  // Google Grey 900
  static Color get textSecondary => const Color(0xFF5F6368);  // Google Grey 700
  static Color get textLight => const Color(0xFFFFFFFF);
  static Color get textGrey => const Color(0xFF9AA0A6);  // Google Grey 500
  
  // 强调色
  static Color get accentBlue => const Color(0xFF1A73E8);  // Google Blue 600
  static Color get accentGreen => const Color(0xFF34A853);  // Google Green
  static Color get accentYellow => const Color(0xFFFBBC04);  // Google Yellow
  static Color get accentRed => const Color(0xFFEA4335);  // Google Red
  
  // 边框颜色
  static Color get border => const Color(0xFFDADCE0);  // Google Grey 200
  static Color get borderLight => const Color(0xFFE8EAED);  // Google Grey 100
  
  // 状态颜色
  static Color get success => const Color(0xFF34A853);  // Google Green
  static Color get warning => const Color(0xFFFBBC04);  // Google Yellow
  static Color get error => const Color(0xFFEA4335);  // Google Red
  static Color get info => const Color(0xFF4285F4);  // Google Blue
  
  // Google Web Designer 渐变色
  static List<Color> get primaryGradient => [
    const Color(0xFF1A73E8),  // 起始颜色
    const Color(0xFF185ABC),  // 结束颜色
  ];
  
  static List<Color> get blueGradient => [
    const Color(0xFF4285F4),
    const Color(0xFF1967D2),
  ];
  
  // 暗色模式颜色
  static final _isDarkMode = Get.isDarkMode;
  
  // 获取主题相关颜色
  static Color get scaffoldBackground => 
      _isDarkMode ? backgroundDark : background;
  
  static Color get textColor =>
      _isDarkMode ? textLight : textPrimary;
  
  static Color get textColorSecondary =>
      _isDarkMode ? textGrey : textSecondary;
      
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
