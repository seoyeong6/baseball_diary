import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/viewmodels/select_viewmodels.dart';
import 'package:baseball_diary/theme/theme_viewmodel.dart';
import 'package:baseball_diary/route_const.dart';
import 'package:baseball_diary/authentication/providers/auth_providers.dart'; // 이 줄 추가
import 'package:firebase_auth/firebase_auth.dart'; // 로그아웃에 필요

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
      body: Consumer(
        builder: (context, ref, _) {
          final authState = ref.watch(authStreamProvider);
          final selectedTeam = ref.watch(selectViewModelProvider);
          final teamName = selectedTeam.split(' ').first;
          final isDarkMode = ref.watch(themeViewModelProvider);
          final themeViewModel = ref.watch(themeViewModelProvider.notifier);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ✅ 로그인 상태 표시
              authState.when(
                data: (user) {
                  final text = user != null ? '로그인 계정: ${user.email}' : '비로그인';
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4,
                    ),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
                loading:
                    () => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('로딩 중...'),
                    ),
                error:
                    (e, _) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('에러 발생: $e'),
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

              // ✅ 로그아웃 기능 연결
              ListTile(
                title: Text(
                  '로그아웃',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          );
        },
      ),
    );
  }
}
