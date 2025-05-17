import 'package:flutter/material.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';

class DetailPostScreen extends StatelessWidget {
  final PostModel post;

  const DetailPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(radius: 16, backgroundImage: AssetImage(post.emotion)),
            const SizedBox(width: 16),
            Text(post.title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${post.createdAt.year}.${post.createdAt.month.toString().padLeft(2, '0')}.${post.createdAt.day.toString().padLeft(2, '0')} ${post.createdAt.hour.toString().padLeft(2, '0')}:${post.createdAt.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(post.content, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: const Text('이미지'),
            ),
          ],
        ),
      ),
    );
  }
}
