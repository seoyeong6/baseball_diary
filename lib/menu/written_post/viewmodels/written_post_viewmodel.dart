import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart';

class WrittenPostViewModel extends StateNotifier<AsyncValue<List<PostModel>>> {
  final Ref ref;
  DateTime _selectedDate = DateTime.now();
  List<PostModel> _allPosts = [];

  WrittenPostViewModel(this.ref) : super(const AsyncValue.loading()) {
    _loadPosts();
  }

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    _filterPosts();
  }

  void _filterPosts() {
    if (_allPosts.isEmpty) return;

    final filteredPosts =
        _allPosts.where((post) {
          return post.createdAt.year == _selectedDate.year &&
              post.createdAt.month == _selectedDate.month;
        }).toList();

    state = AsyncValue.data(filteredPosts);
  }

  Future<void> _loadPosts() async {
    state = const AsyncValue.loading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        final localRepo = ref.read(localPostRepoProvider);
        _allPosts = await localRepo.fetchPosts();
      } else {
        final repo = ref.read(postRepoProvider);
        _allPosts = await repo.fetchPosts(user.uid);
      }
      if (_allPosts.isEmpty) {
        state = const AsyncValue.data([]);
      } else {
        _filterPosts();
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
