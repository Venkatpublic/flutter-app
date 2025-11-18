import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_basic/src/presentation/screens/login_screen.dart';
import 'package:flutter_basic/src/presentation/screens/register_screen.dart';
import 'package:flutter_basic/src/presentation/screens/main_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
    ),
  ],
);

final routerProvider = Provider<GoRouter>((ref) => router);