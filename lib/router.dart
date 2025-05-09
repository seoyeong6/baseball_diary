import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/views/select_screen.dart';
import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'package:baseball_diary/authentication/views/login_screen.dart';
import 'route_const.dart';
import 'package:baseball_diary/menu/written_post/view/written_post.dart';

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
    GoRoute(
      path: loginRoute,
      name: loginRouteName,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: writtenPostRoute,
      name: writtenPostRouteName,
      builder: (context, state) => const WrittenPostScreen(),
    ),
  ],
);
