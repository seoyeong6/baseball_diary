import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';

class SelectScreen extends ConsumerWidget {
  static const String routeName = '/';

  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(selectViewModelProvider.notifier);
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teams = viewModel.teams; // ✅ 지역 변수로 꺼냄

    return Scaffold(
      appBar: AppBar(
        title: Text('팀 선택', style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index]; // ✅ 가독성 개선
              return GestureDetector(
                onTap: () async {
                  await viewModel.setTeam(team);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$team가 선택되었습니다.'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    context.go(MainNavigationScreen.routeName);
                  }
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
                        const Icon(Icons.sports_baseball_outlined),
                        const SizedBox(width: 10),
                        Text(
                          team,
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
