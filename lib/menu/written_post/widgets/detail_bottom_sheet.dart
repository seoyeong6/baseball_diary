import 'package:flutter/material.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';

class DetailBottomSheet extends StatelessWidget {
  final PostModel post;

  const DetailBottomSheet({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 날짜
            Text(
              '${post.createdAt.year}.${post.createdAt.month.toString().padLeft(2, '0')}.${post.createdAt.day.toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),

            // 제목
            Text(post.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            // 감정 이모지
            if (post.emotion.isNotEmpty)
              Center(child: Image.asset(post.emotion, width: 40, height: 40)),

            const SizedBox(height: 16),

            // 본문
            Text(post.content, style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: 24),

            // (추후) 삭제/수정 버튼 영역
            // Row(
            //   children: [
            //     TextButton(onPressed: () {}, child: Text("수정")),
            //     TextButton(onPressed: () {}, child: Text("삭제")),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
