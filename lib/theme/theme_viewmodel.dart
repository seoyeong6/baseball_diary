import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/theme/app_theme.dart';

class ThemeViewModel extends Notifier<bool> {
  @override
  bool build() {
    final window = WidgetsBinding.instance.window;
    return window.platformBrightness == Brightness.dark;
  }

  void setIsDarkMode(bool value) {
    state = value;
  }

  ThemeData get currentTheme =>
      state ? AppTheme.darkTheme : AppTheme.lightTheme;
}

final themeViewModelProvider = NotifierProvider<ThemeViewModel, bool>(() {
  return ThemeViewModel();
});
