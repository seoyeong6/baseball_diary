import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:baseball_diary/router.dart';
import 'package:baseball_diary/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/select/repos/select_repo.dart';
import 'package:baseball_diary/core/preferences_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (context) => SelectViewModel(
                SelectRepository(PreferencesService.preferences),
              ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
