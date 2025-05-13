import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/written_post/viewmodels/written_post_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/route_const.dart';

class WrittenPostScreen extends ConsumerWidget {
  const WrittenPostScreen({super.key});

  void _onDetailTap(BuildContext context, PostModel post) {
    context.pushNamed(detailPostRouteName, extra: post);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teamName =
        selectedTeam.trim().isNotEmpty ? selectedTeam.split(' ').first : '???';
    final postsAsync = ref.watch(writtenPostProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('나의 야구 일기', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(teamName, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  final currentDate =
                      ref.read(writtenPostProvider.notifier).selectedDate;
                  final newDate = DateTime(
                    currentDate.year,
                    currentDate.month - 1,
                  );
                  ref
                      .read(writtenPostProvider.notifier)
                      .setSelectedDate(newDate);
                },
                icon: const Text("<"),
              ),
              Text(
                '${ref.watch(writtenPostProvider.notifier).selectedDate.year}. ${ref.watch(writtenPostProvider.notifier).selectedDate.month.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () {
                  final currentDate =
                      ref.read(writtenPostProvider.notifier).selectedDate;
                  final newDate = DateTime(
                    currentDate.year,
                    currentDate.month + 1,
                  );
                  ref
                      .read(writtenPostProvider.notifier)
                      .setSelectedDate(newDate);
                },
                icon: const Text(">"),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: postsAsync.when(
              data: (posts) {
                if (posts.isEmpty) {
                  return const Center(child: Text('작성된 일기가 없습니다.'));
                }

                return ListView.separated(
                  itemCount: posts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return GestureDetector(
                      onTap: () => _onDetailTap(context, post),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.sports_baseball_sharp,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${post.createdAt.year}.${post.createdAt.month.toString().padLeft(2, '0')}.${post.createdAt.day.toString().padLeft(2, '0')} ${post.createdAt.hour.toString().padLeft(2, '0')}:${post.createdAt.minute.toString().padLeft(2, '0')}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    post.content,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[300],
                                    alignment: Alignment.center,
                                    child: const Text('이미지'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('에러 발생: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
