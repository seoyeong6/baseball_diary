import 'package:go_router/go_router.dart';
import 'package:baseball_diary/authentication/select_screen.dart';
import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'route_const.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: selectRoute,
      name: selectRouteName,
      builder: (context, state) => SelectScreen(),
    ),
    GoRoute(
      path: mainNavigationRoute,
      name: mainNavigationRouteName,
      builder: (context, state) => const MainNavigationScreen(),
    ),
  ],
);
