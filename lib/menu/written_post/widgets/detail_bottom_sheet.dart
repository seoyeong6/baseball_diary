import 'package:flutter/material.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';

class DetailBottomSheet extends StatelessWidget {
  final PostModel post;

  const DetailBottomSheet({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            '${post.createdAt.year}.${post.createdAt.month.toString().padLeft(2, '0')}.${post.createdAt.day.toString().padLeft(2, '0')}',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(post.content),
        ],
      ),
    );
  }
}
