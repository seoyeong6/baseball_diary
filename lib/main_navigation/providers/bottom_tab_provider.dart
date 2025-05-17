import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 현재 선택된 BottomNavigationBar의 인덱스를 저장하는 Provider
final bottomTabProvider = StateProvider<int>((ref) => 0);
