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
          title: '',
          content: '',
          emotion: '',
          createdAt: DateTime.now(),
          userId: null,
        ),
      ) {
    // 현재 Firebase 인증 상태 확인
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      updateUserId(currentUser.uid);
    }

    // Firebase 인증 상태 변화 감지
    ref.listen<AsyncValue<User?>>(authStreamProvider, (previous, next) {
      next.whenData((user) {
        if (user != null) {
          updateUserId(user.uid);
        } else {
          updateUserId(null);
        }
      });
    });
  }

  void updateTitle(String title) {
    state = PostModel(
      title: title,
      content: state.content,
      emotion: state.emotion,
      createdAt: state.createdAt,
      userId: state.userId,
    );
  }

  void updateContent(String content) {
    state = PostModel(
      title: state.title,
      content: content,
      emotion: state.emotion,
      createdAt: state.createdAt,
      userId: state.userId,
    );
  }

  void updateEmotion(String emotion) {
    state = PostModel(
      title: state.title,
      content: state.content,
      emotion: emotion,
      createdAt: state.createdAt,
      userId: state.userId,
    );
  }

  void updateUserId(String? userId) {
    state = PostModel(
      title: state.title,
      content: state.content,
      emotion: state.emotion,
      createdAt: state.createdAt,
      userId: userId,
    );
  }

  void reset() {
    state = PostModel(
      title: '',
      content: '',
      emotion: '',
      createdAt: DateTime.now(),
      userId: null,
    );
  }

  Future<void> save() async {
    final userId = state.userId;

    try {
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
