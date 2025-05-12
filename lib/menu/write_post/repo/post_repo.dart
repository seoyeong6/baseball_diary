import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savePost(PostModel post) async {
    try {
      final json = post.toJson();
      print('📦 저장 요청: $json');
      await _db.collection('posts').add(json);
      print('✅ Firestore 저장 성공');
    } catch (e, stack) {
      print('❌ Firestore 저장 실패: $e');
      print(stack);
    }
  }

  Future<List<PostModel>> fetchPosts(String userId) async {
    final snapshot =
        await _db
            .collection('posts')
            .where('userId', isEqualTo: userId) // ✅ 사용자 ID로 필터링 추가
            .orderBy('createdAt', descending: true)
            .get();

    return snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
  }
}

final postRepoProvider = Provider((ref) => PostRepository());
