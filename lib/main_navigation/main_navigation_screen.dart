import 'package:baseball_diary/menu/written_post/view/written_post.dart';
import 'package:baseball_diary/menu/write_post/view/write_post.dart';
import 'package:baseball_diary/menu/setting_screen.dart';
import 'package:baseball_diary/main_navigation/widget/nav_tab.dart';
import 'package:baseball_diary/main_navigation/providers/bottom_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends ConsumerWidget {
  static const String routeName = '/main';

  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomTabProvider);

    void onTap(int index) {
      ref.read(bottomTabProvider.notifier).state = index;
    }

    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const Center(child: Text('Calendar')),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: const WrittenPostScreen(),
          ),
          Offstage(offstage: selectedIndex != 2, child: const WritePost()),
          Offstage(
            offstage: selectedIndex != 3,
            child: const Center(child: Text('Statistics')),
          ),
          Offstage(offstage: selectedIndex != 4, child: const SettingScreen()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 88,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavTab(
                text: "캘린더",
                isSelected: selectedIndex == 0,
                icon: FontAwesomeIcons.calendar,
                onTap: () => onTap(0),
              ),
              NavTab(
                text: "일기",
                isSelected: selectedIndex == 1,
                icon: FontAwesomeIcons.book,
                onTap: () => onTap(1),
              ),
              NavTab(
                text: "기록",
                isSelected: selectedIndex == 2,
                icon: FontAwesomeIcons.message,
                onTap: () => onTap(2),
              ),
              NavTab(
                text: "통계",
                isSelected: selectedIndex == 3,
                icon: FontAwesomeIcons.chartLine,
                onTap: () => onTap(3),
              ),
              NavTab(
                text: "설정",
                isSelected: selectedIndex == 4,
                icon: FontAwesomeIcons.gear,
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
