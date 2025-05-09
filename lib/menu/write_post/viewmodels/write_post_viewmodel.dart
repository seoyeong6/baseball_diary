import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';

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
      );

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

  void save() async {
    final repo = ref.read(postRepoProvider);
    await repo.savePost(state);
  }
}

final writePostProvider = StateNotifierProvider<WritePostViewModel, PostModel>(
  (ref) => WritePostViewModel(ref),
);
