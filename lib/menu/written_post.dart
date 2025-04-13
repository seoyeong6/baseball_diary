import 'package:flutter/material.dart';
import 'package:baseball_diary/main_navigation/widget/detail_bottom_sheet.dart';

class WrittenPost extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('나의 야구 일기'),
        centerTitle: true,
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
