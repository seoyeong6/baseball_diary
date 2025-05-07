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
            itemCount: viewModel.teams.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await viewModel.setTeam(viewModel.teams[index]);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${viewModel.teams[index]}가 선택되었습니다.'),
                        duration: Duration(seconds: 2),
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
                        Icon(Icons.sports_baseball_outlined),
                        SizedBox(width: 10),
                        Text(
                          viewModel.teams[index],
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
