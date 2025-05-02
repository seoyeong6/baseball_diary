import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/theme/theme_viewmodel.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(selectViewModelProvider);
    final teamName = selectedTeam.split(' ').first;
    final isDarkMode = ref.watch(themeViewModelProvider);
    final themeViewModel = ref.watch(themeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('설정', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(teamName, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              '로그인(백업용)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {},
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('팀 변경', style: Theme.of(context).textTheme.titleMedium),
            onTap: () => GoRouter.of(context).push('/'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          SwitchListTile(
            title: Text(
              '다크모드 설정',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            value: isDarkMode,
            onChanged: (value) {
              themeViewModel.setIsDarkMode(value);
            },
          ),
        ],
      ),
    );
  }
}
