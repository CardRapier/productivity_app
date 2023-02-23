import 'package:flutter/material.dart';
import 'package:productivity_app/router/my_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: MyRouter.router.routerDelegate,
      routeInformationParser: MyRouter.router.routeInformationParser,
      routeInformationProvider: MyRouter.router.routeInformationProvider,
    );
  }
}
