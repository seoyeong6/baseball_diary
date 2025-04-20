import 'package:flutter/material.dart';
import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:baseball_diary/authentication/login_screen.dart';
import 'package:baseball_diary/authentication/select_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: TextTheme(
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
        ),
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF1E2022),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
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
        ),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Color(0xFF52616A),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
      ),
      home: LoginScreen(),
    );
  }
}
