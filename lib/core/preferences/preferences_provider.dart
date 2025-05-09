import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'preferences_service.dart';

/// main.dart에서 override되는 SharedPreferences provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  print("❌ sharedPreferencesProvider evaluated before override");
  throw UnimplementedError(); // main.dart에서 override할 예정
});

/// PreferencesService 주입용 Provider
final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PreferencesService(prefs);
});
