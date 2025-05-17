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

/// ✅ PreferencesService를 지연 평가 방식으로 주입받는 Provider
final selectRepositoryProvider = Provider<SelectRepository>((ref) {
  // ❗ 반드시 read() 사용: 평가 시점 지연
  final preferencesService = ref.read(preferencesServiceProvider);
  return SelectRepository(preferencesService);
});
