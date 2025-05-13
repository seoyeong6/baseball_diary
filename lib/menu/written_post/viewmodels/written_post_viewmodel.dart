import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/repo/local_post_repo.dart';

class WrittenPostViewModel extends StateNotifier<AsyncValue<List<PostModel>>> {
  final Ref ref;
  List<PostModel> _allPosts = [];
  final List<PostModel> _filteredPosts = [];
  DateTime _selectedMonth = DateTime.now();
  StreamSubscription<User?>? _authStateSubscription;

  WrittenPostViewModel(this.ref) : super(const AsyncValue.loading()) {
    _loadPosts();
    _setupAuthStateListener();
  }

  void _setupAuthStateListener() {
    _authStateSubscription = FirebaseAuth.instance.authStateChanges().listen((
      User? user,
    ) {
      _loadPosts();
    });
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }

  DateTime get selectedDate => _selectedMonth;

  void setSelectedDate(DateTime date) {
    _selectedMonth = date;
    _filterPosts();
  }

  void _filterPosts() {
    if (_allPosts.isEmpty) return;

    final filteredPosts =
        _allPosts.where((post) {
          return post.createdAt.year == _selectedMonth.year &&
              post.createdAt.month == _selectedMonth.month;
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
