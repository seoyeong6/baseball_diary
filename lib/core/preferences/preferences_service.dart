import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences의 비즈니스 로직만 담은 클래스
class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService(this.prefs);

  Future<void> saveTeam(String team) async {
    await prefs.setString('team', team);
  }

  String getTeam() {
    return prefs.getString('team') ?? '';
  }
}
