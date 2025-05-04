import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';

class WritePost extends ConsumerWidget {
  const WritePost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teamName = selectedTeam.split(' ').first;

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
                      children: [
                        Image.asset(
                          'assets/images/happy1.png',
                          width: 30,
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/happy2.png',
                          width: 30,
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/pale.png',
                          width: 30,
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/despair.png',
                          width: 30,
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/angry.png',
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
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
    );
  }
}
