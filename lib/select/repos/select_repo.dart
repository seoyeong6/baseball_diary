import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/core/preferences/preferences_service.dart';
import 'package:baseball_diary/core/preferences/preferences_provider.dart';

class SelectRepository {
  final PreferencesService _preferencesService;

  SelectRepository(this._preferencesService);

  Future<void> saveTeam(String team) async {
    await _preferencesService.saveTeam(team);
  }

  String getTeam() {
    return _preferencesService.getTeam();
  }
}

/// ✅ PreferencesService를 주입받는 Provider
final selectRepositoryProvider = Provider<SelectRepository>((ref) {
  final preferencesService = ref.watch(preferencesServiceProvider);
  return SelectRepository(preferencesService);
});
