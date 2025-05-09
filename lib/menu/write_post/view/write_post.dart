import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/menu/write_post/view/emotion_images.dart';
import 'package:baseball_diary/menu/write_post/viewmodels/write_post_viewmodel.dart';
import 'package:baseball_diary/menu/written_post/view/written_post.dart';

class WritePost extends ConsumerWidget {
  const WritePost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teamName = selectedTeam.split(' ').first;
    final viewModel = ref.watch(writePostProvider.notifier);
    final post = ref.watch(writePostProvider); // 선택된 상태 읽기

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '오늘의 야구 일기',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(teamName, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.check, color: Colors.black, size: 24),
                      ],
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      onChanged: (value) => viewModel.updateTitle(value),
                      decoration: InputDecoration(
                        hintText: '제목을 입력하세요',
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.all(16),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),

                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          EmotionImages.paths.map((path) {
                            final isSelected = post.emotion == path;
                            final size = isSelected ? 35.0 : 30.0;

                            return GestureDetector(
                              onTap: () => viewModel.updateEmotion(path),
                              child: Image.asset(
                                path,
                                width: size,
                                height: size,
                              ),
                            );
                          }).toList(),
                    ),

                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
                        onChanged: (value) => viewModel.updateContent(value),
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          hintText: '내용을 입력하세요',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text('오늘의 사진'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () async {
                ref.read(writePostProvider.notifier).save();

                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WrittenPostScreen(),
                    ),
                  );
                }
              },

              icon: Icon(Icons.save),
              label: Text('저장하기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
