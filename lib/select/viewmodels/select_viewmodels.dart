import 'package:flutter/material.dart';
import 'package:baseball_diary/select/repos/select_repo.dart';
import 'package:baseball_diary/select/models/select_models.dart';

class SelectViewModel extends ChangeNotifier {
  final SelectRepository _repository;

  late final List<String> _teams = SelectModel().teams;

  SelectViewModel(this._repository);

  Future<void> setTeam(String team) async {
    await _repository.saveTeam(team);
    notifyListeners();
  }

  String getTeam() {
    return _repository.getTeam();
  }

  List<String> get teams => _teams;
}
