import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart';

class WrittenPostViewModel extends AutoDisposeAsyncNotifier<List<PostModel>> {
  @override
  Future<List<PostModel>> build() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      final localRepo = ref.read(localPostRepoProvider);
      // 🔥 평가를 지연시키기 위해 Future로 감쌈
      return Future(() => localRepo.fetchPosts());
    } else {
      final repo = ref.read(postRepoProvider);
      return await repo.fetchPosts();
    }
  }
}

final writtenPostProvider =
    AutoDisposeAsyncNotifierProvider<WrittenPostViewModel, List<PostModel>>(
      () => WrittenPostViewModel(),
    );
