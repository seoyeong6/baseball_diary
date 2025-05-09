import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/menu/write_post/repo/post_repo.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';

final writtenPostProvider = FutureProvider<List<PostModel>>((ref) async {
  final repo = ref.read(postRepoProvider);
  return await repo.fetchPosts(); // 아직 이 함수는 만들지 않았어!
});
