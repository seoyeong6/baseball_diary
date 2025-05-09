import 'package:go_router/go_router.dart';
import 'package:baseball_diary/select/views/select_screen.dart';
import 'package:baseball_diary/main_navigation/main_navigation_screen.dart';
import 'package:baseball_diary/authentication/views/login_screen.dart';
import 'route_const.dart';
import 'package:baseball_diary/menu/written_post/view/written_post.dart';
import 'package:baseball_diary/menu/write_post/models/post_model.dart';
import 'package:baseball_diary/menu/written_post/view/detail_post_screen.dart';
import 'package:baseball_diary/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: splashRoute,
      name: splashRouteName,
      builder: (context, state) => const SplashScreen(),
    ),
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
    GoRoute(
      path: detailPostRoute,
      name: detailPostRouteName,
      builder: (context, state) {
        final post = state.extra;
        if (post is! PostModel) {
          return const Scaffold(body: Center(child: Text('잘못된 접근입니다')));
        }
        return DetailPostScreen(post: post);
      },
    ),
  ],
);
