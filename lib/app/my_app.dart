import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:baseball_diary/app/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/theme/theme_viewmodel.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeDataProvider);

    return MaterialApp.router(
      routerConfig: router, // ✅ GoRouter 연결
      theme: theme,
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
    );
  }
}
