import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/theme/theme_viewmodel.dart';
import 'package:baseball_diary/app/route_const.dart';
import 'package:baseball_diary/authentication/providers/auth_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baseball_diary/authentication/repos/auth_repo.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStreamProvider);

    return authState.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('에러 발생: $e'))),
      data: (user) {
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
              child: Text(
                teamName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4,
                ),
                child: Text(
                  user != null ? '로그인 계정: ${user.email}' : '비로그인',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  '로그인(백업용)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () => GoRouter.of(context).push(loginRoute),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text(
                  '팀 변경',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () => GoRouter.of(context).pushNamed('select'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              SwitchListTile(
                title: Text(
                  '다크모드 설정',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                value: isDarkMode,
                onChanged: themeViewModel.setIsDarkMode,
              ),
              ListTile(
                title: Text(
                  '로그아웃',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () async {
                  await ref.read(authRepo).signOut();
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        );
      },
    );
  }
}
