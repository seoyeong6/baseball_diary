import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/select/repos/select_repo.dart';
import 'package:baseball_diary/select/models/select_models.dart';

class SelectViewModel extends Notifier<String> {
  late final SelectRepository _repository;
  late final List<String> _teams;

  @override
  String build() {
    _repository = ref.watch(selectRepositoryProvider); // ✅ 의존성 주입
    _teams = SelectModel().teams;
    return _repository.getTeam();
  }

  Future<void> setTeam(String team) async {
    await _repository.saveTeam(team);
    state = team;
  }

  String getTeam() => state;
  List<String> get teams => _teams;
}

final selectViewModelProvider = NotifierProvider<SelectViewModel, String>(() {
  return SelectViewModel();
});
