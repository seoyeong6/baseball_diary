import 'package:flutter/material.dart';
import 'package:baseball_diary/main_navigation/widget/detail_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/app/my_app.dart';

class WrittenPost extends ConsumerWidget {
  const WrittenPost({super.key});

  void _onDetailTap(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const DetailBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teamName = selectedTeam.split(' ').first;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("<"),
              SizedBox(width: 10),
              Text('2025. 04', style: TextStyle(fontSize: 16)),
              SizedBox(width: 10),
              Text(">"),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 24);
              },
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onDetailTap(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
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
                                  'datetime',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'title',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '여기에 일기를 씁니다. 길게길게 써봅시다. 여기에 일기를 씁니다. 길게길게 써봅시다. 여기에 일기를 씁니다. 길게길게 써봅시다.',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
