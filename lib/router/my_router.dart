import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:productivity_app/modules/home/views/home_view.dart';
import 'package:productivity_app/modules/todo/view/todo_view.dart';
import 'package:productivity_app/router/routes_constants.dart';

class MyRouter {
  static final GoRouter router =
      GoRouter(initialLocation: RoutesConstants.home, routes: <GoRoute>[
    GoRoute(
      path: RoutesConstants.home,
      name: RoutesConstants.home,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          customTransition(childWidget: const HomeView()),
    ),
    GoRoute(
      path: RoutesConstants.todo,
      name: RoutesConstants.todo,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          customTransition(childWidget: const TodoView()),
    ),
  ]);

  static CustomTransitionPage<void> customTransition(
      {required Widget childWidget}) {
    return CustomTransitionPage<void>(
      child: childWidget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
