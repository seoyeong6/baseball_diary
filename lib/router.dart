import 'package:baseball_diary/authentication/select_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SelectScreen.routeName,
      builder: (context, state) => SelectScreen(),
    ),
    GoRoute(
      path: MainNavigationScreen.routeName,
      builder: (context, state) => MainNavigationScreen(),
    ),
  ],
);
