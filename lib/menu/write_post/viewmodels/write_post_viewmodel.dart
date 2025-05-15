import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart';
import 'package:baseball_diary/authentication/providers/auth_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WritePostViewModel extends StateNotifier<PostModel> {
  final Ref ref;

  WritePostViewModel(this.ref)
    : super(
        PostModel(
          id: null,
          title: '',
          content: '',
          emotion: '',
          createdAt: DateTime.now(),
          userId: null,
        ),
      ) {
    // 초기 로그인 상태 반영
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      updateUserId(currentUser.uid);
    }

    // 로그인 상태 변화 감지
    ref.listen<AsyncValue<User?>>(authStreamProvider, (previous, next) {
      next.whenData((user) {
        updateUserId(user?.uid);
      });
    });
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateContent(String content) {
    state = state.copyWith(content: content);
  }

  void updateEmotion(String emotion) {
    state = state.copyWith(emotion: emotion);
  }

  void updateUserId(String? userId) {
    state = state.copyWith(userId: userId);
  }

  void reset() {
    state = PostModel(
      id: null,
      title: '',
      content: '',
      emotion: '',
      createdAt: DateTime.now(),
      userId: null,
    );
  }

  Future<void> save() async {
    try {
      final userId = state.userId;
      if (userId == null) {
        final localRepo = ref.read(localPostRepoProvider);
        await localRepo.savePost(state);
      } else {
        final repo = ref.read(postRepoProvider);
        await repo.savePost(state);
      }
    } catch (e, stack) {
      print('❌ ViewModel 저장 실패: $e');
      print(stack);
    }
  }
}

final writePostProvider = StateNotifierProvider<WritePostViewModel, PostModel>(
  (ref) => WritePostViewModel(ref),
);
