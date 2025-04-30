import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception('PreferencesService not initialized');
    }
    return _preferences!;
  }
}
