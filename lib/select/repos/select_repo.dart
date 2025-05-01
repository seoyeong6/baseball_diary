import 'package:shared_preferences/shared_preferences.dart';

class SelectRepository {
  final SharedPreferences _preferences;

  SelectRepository(this._preferences);

  Future<void> saveTeam(String team) async {
    await _preferences.setString('team', team);
  }

  String getTeam() {
    return _preferences.getString('team') ?? '';
  }
}
