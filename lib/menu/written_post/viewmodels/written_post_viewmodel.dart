import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WrittenPostViewModel extends AsyncNotifier<List<PostModel>> {
  @override
  Future<List<PostModel>> build() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // ✅ 비로그인 → 로컬에서 불러오기
      final localRepo = ref.read(localPostRepoProvider);
      return localRepo.fetchPosts();
    } else {
      // ✅ 로그인 → Firebase에서 불러오기
      final repo = ref.read(postRepoProvider);
      return repo.fetchPosts();
    }
  }
}

final writtenPostProvider =
    AsyncNotifierProvider<WrittenPostViewModel, List<PostModel>>(
      () => WrittenPostViewModel(),
    );
