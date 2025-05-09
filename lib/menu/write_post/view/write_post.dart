import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/menu/write_post/view/emotion_images.dart';
import 'package:baseball_diary/menu/write_post/viewmodels/write_post_viewmodel.dart';
import 'package:baseball_diary/main_navigation/providers/bottom_tab_provider.dart';
import 'package:baseball_diary/route_const.dart';
import 'package:baseball_diary/menu/written_post/viewmodels/written_post_viewmodel.dart';

class WritePost extends ConsumerStatefulWidget {
  const WritePost({super.key});

  @override
  ConsumerState<WritePost> createState() => _WritePostState();
}

class _WritePostState extends ConsumerState<WritePost> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _resetControllers() {
    _titleController.clear();
    _contentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teamName = selectedTeam.split(' ').first;
    final viewModel = ref.read(writePostProvider.notifier);
    final post = ref.watch(writePostProvider);

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
                      children: const [
                        Icon(Icons.check, color: Colors.black, size: 24),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _titleController,
                      onChanged: viewModel.updateTitle,
                      decoration: const InputDecoration(
                        hintText: '제목을 입력하세요',
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.all(16),
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
                        controller: _contentController,
                        onChanged: viewModel.updateContent,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          hintText: '내용을 입력하세요',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        style: const TextStyle(fontSize: 14),
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
                      alignment: Alignment.center,
                      child: const Text('오늘의 사진'),
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
                await ref.read(writePostProvider.notifier).save();
                ref.invalidate(writtenPostProvider); // 리스트 갱신
                ref.read(writePostProvider.notifier).reset(); // 상태 초기화
                _resetControllers(); // 텍스트필드 초기화
                ref.read(bottomTabProvider.notifier).state = 1; // 탭 이동
                if (context.mounted) {
                  context.goNamed(mainNavigationRouteName); // 메인화면으로 이동
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('저장하기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
