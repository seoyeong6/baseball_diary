import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:baseball_diary/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart'; // ✅ 추가
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance(); // ✅ 인스턴스 준비

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs), // ✅ 주입
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MaterialApp(home: SplashScreen()),
      ),
    ),
  );
}
