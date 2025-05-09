import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savePost(PostModel post) async {
    await _db.collection('posts').add(post.toJson());
  }

  Future<List<PostModel>> fetchPosts() async {
    final snapshot =
        await _db
            .collection('posts')
            .orderBy('createdAt', descending: true)
            .get();

    return snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
  }
}

final postRepoProvider = Provider((ref) => PostRepository());
