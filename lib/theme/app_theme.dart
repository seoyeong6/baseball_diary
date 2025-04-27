import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 라이트 모드 색상 팔레트
  static const Color lightBackgroundColor = Colors.white;
  static const Color lightSurfaceColor = Color(0xFFF5F5F5);
  static const Color lightPrimaryColor = Color(0xFF1E2022);
  static const Color lightTextColor = Colors.black87;
  static const Color lightAccentColor = Colors.blueAccent;
  static const Color lightErrorColor = Color(0xFFB00020);
  static const Color lightSuccessColor = Color(0xFF4CAF50);
  static const Color lightWarningColor = Color(0xFFFFC107);
  static const Color lightDisabledColor = Color(0xFF9E9E9E);

  // 다크 모드 색상 팔레트
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color darkPrimaryColor = Color(0xFF52616A);
  static const Color darkTextColor = Colors.white;
  static const Color darkAccentColor = Colors.lightBlueAccent;
  static const Color darkErrorColor = Color(0xFFCF6679);
  static const Color darkSuccessColor = Color(0xFF81C784);
  static const Color darkWarningColor = Color(0xFFFFD54F);
  static const Color darkDisabledColor = Color(0xFF757575);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: _textTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
      foregroundColor: lightTextColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: lightBackgroundColor,
    primaryColor: lightPrimaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(color: lightBackgroundColor),
    colorScheme: ColorScheme.light(
      surface: lightSurfaceColor,
      primary: lightPrimaryColor,
      secondary: lightAccentColor,
      error: lightErrorColor,
      onSurface: lightTextColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: _textTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      foregroundColor: darkTextColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryColor: darkPrimaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(color: darkBackgroundColor),
    colorScheme: ColorScheme.dark(
      surface: darkSurfaceColor,
      primary: darkPrimaryColor,
      secondary: darkAccentColor,
      error: darkErrorColor,
      onSurface: darkTextColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
    ),
  );

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.gowunDodum(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.gowunDodum(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.gowunDodum(
        fontSize: 48,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.gowunDodum(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.gowunDodum(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.gowunDodum(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.gowunDodum(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.gowunDodum(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.gowunDodum(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.gowunDodum(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      labelLarge: GoogleFonts.gowunDodum(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      bodySmall: GoogleFonts.gowunDodum(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.gowunDodum(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }
}
