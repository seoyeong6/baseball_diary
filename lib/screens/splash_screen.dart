import 'package:flutter/material.dart';
import 'package:baseball_diary/core/preferences_service.dart';
import 'package:baseball_diary/app/my_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await PreferencesService.init();
    // 필요한 경우 여기에 다른 초기화 작업 추가
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => const MyApp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 여기에 앱 로고나 이미지 추가
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            const Text('로딩 중...'),
          ],
        ),
      ),
    );
  }
}
