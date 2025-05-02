import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:baseball_diary/router.dart';
import 'package:baseball_diary/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/theme/theme_viewmodel.dart';

final selectViewModelProvider = NotifierProvider<SelectViewModel, String>(() {
  return SelectViewModel();
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeViewModelProvider);
    final themeViewModel = ref.watch(themeViewModelProvider.notifier);

    return MaterialApp.router(
      title: 'Baseball Diary',
      theme: themeViewModel.currentTheme,
      routerConfig: router,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
