import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/models/select_models.dart';

class SelectScreen extends StatelessWidget {
  static const String routeName = '/';

  const SelectScreen({super.key});

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
            itemCount: SelectModel().teams.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.go(MainNavigationScreen.routeName);
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
                          SelectModel().teams[index],
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
