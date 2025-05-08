import 'package:baseball_diary/select/repos/select_repo.dart';
import 'package:baseball_diary/select/models/select_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/core/preferences_service.dart';

class SelectViewModel extends Notifier<String> {
  late final SelectRepository _repository;
  late final List<String> _teams;

  @override
  String build() {
    _repository = SelectRepository(PreferencesService.preferences);
    _teams = SelectModel().teams;
    return _repository.getTeam();
  }

  Future<void> setTeam(String team) async {
    await _repository.saveTeam(team);
    state = team;

    // ✅ 팀 선택 완료 플래그 저장
    await PreferencesService.preferences.setBool('hasSelectedTeam', true);
  }

  String getTeam() => state;
  List<String> get teams => _teams;
}

final selectViewModelProvider = NotifierProvider<SelectViewModel, String>(() {
  return SelectViewModel();
});
