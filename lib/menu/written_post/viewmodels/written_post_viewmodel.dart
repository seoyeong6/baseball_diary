import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart';

class WrittenPostViewModel extends StateNotifier<AsyncValue<List<PostModel>>> {
  final Ref ref;
  DateTime _selectedDate = DateTime.now();

  WrittenPostViewModel(this.ref) : super(const AsyncValue.loading()) {
    _loadPosts();
  }

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    state = const AsyncValue.loading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        final localRepo = ref.read(localPostRepoProvider);
        state = AsyncValue.data(localRepo.fetchPosts());
      } else {
        final repo = ref.read(postRepoProvider);
        state = AsyncValue.data(await repo.fetchPosts(user.uid));
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final writtenPostProvider =
    StateNotifierProvider<WrittenPostViewModel, AsyncValue<List<PostModel>>>(
      (ref) => WrittenPostViewModel(ref),
    );
