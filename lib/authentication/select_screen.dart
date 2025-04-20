import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  SelectScreen({super.key});

  final List<String> teams = [
    'KIA 타이거즈',
    '롯데 자이언츠',
    '두산 베어스',
    '삼성 라이온즈',
    '한화 이글스',
    '키움 히어로즈',
    'KT 위즈',
    'LG 트윈스',
    'NC 다이노스',
    'SSG 랜더스',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팀 선택', style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: teams.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainNavigationScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 340,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_baseball_outlined),
                        SizedBox(width: 10),
                        Text(
                          teams[index],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
