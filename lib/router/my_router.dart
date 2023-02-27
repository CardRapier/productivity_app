import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:productivity_app/modules/habits/views/create_habit_view.dart';
import 'package:productivity_app/modules/habits/views/habits_view.dart';
import 'package:productivity_app/modules/home/views/home_view.dart';
import 'package:productivity_app/modules/todo/views/todo_view.dart';
import 'package:productivity_app/router/routes_constants.dart';

class MyRouter {
  static final GoRouter router =
      GoRouter(initialLocation: RoutesConstants.home, routes: <GoRoute>[
    myRoute(
      RoutesConstants.home,
      const HomeView(),
    ),
    myRoute(
      RoutesConstants.todo,
      const TodoView(),
    ),
    myRoute(
      RoutesConstants.habits,
      HabitsView(),
    ),
    myRoute(
      RoutesConstants.createHabits,
      CreateHabitView(),
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

  static GoRoute myRoute(String path, Widget child) {
    return GoRoute(
      path: path,
      name: path,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          customTransition(childWidget: child),
    );
  }
}
