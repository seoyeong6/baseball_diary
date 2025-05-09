import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalPostRepository {
  final SharedPreferences _prefs;

  LocalPostRepository(this._prefs);

  static const _key = 'local_posts';

  /// 저장
  Future<void> savePost(PostModel post) async {
    final List<String> rawPosts = _prefs.getStringList(_key) ?? [];
    rawPosts.add(jsonEncode(post.toJson()));
    await _prefs.setStringList(_key, rawPosts);
  }

  /// 불러오기
  List<PostModel> fetchPosts() {
    final List<String> rawPosts = _prefs.getStringList(_key) ?? [];
    return rawPosts.map((e) => PostModel.fromJson(jsonDecode(e))).toList();
  }

  /// 전체 삭제 (선택사항)
  Future<void> clearAll() async {
    await _prefs.remove(_key);
  }
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // main.dart에서 override할 예정
});

final localPostRepoProvider = Provider<LocalPostRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocalPostRepository(prefs);
});
