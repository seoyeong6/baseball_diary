import 'package:baseball_diary/menu/written_post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baseball_diary/main_navigation/widget/nav_tab.dart';
import 'package:baseball_diary/menu/write_post.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = '/main';

  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(child: Text('Calender', style: TextStyle(fontSize: 49))),
    const Center(child: Text('Diary', style: TextStyle(fontSize: 49))),
    const Center(child: Text('Record', style: TextStyle(fontSize: 49))),
    const Center(child: Text('Statistics', style: TextStyle(fontSize: 49))),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 49))),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: screens[_selectedIndex],
          ),
          Offstage(offstage: _selectedIndex != 1, child: const WrittenPost()),
          Offstage(offstage: _selectedIndex != 2, child: const WritePost()),
          Offstage(
            offstage: _selectedIndex != 3,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: screens[_selectedIndex],
          ),
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
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.calendar,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "일기",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.book,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: "기록",
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.message,
                onTap: () => _onTap(2),
              ),
              NavTab(
                text: "통계",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.chartLine,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "설정",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.gear,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
