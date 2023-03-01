import 'package:flutter/material.dart';
import 'package:productivity_app/modules/habits/providers/habits_provider.dart';
import 'package:productivity_app/router/my_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HabitsProvider>(
              create: (_) => HabitsProvider())
        ],
        child: Builder(
            builder: (context) => MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerDelegate: MyRouter.router.routerDelegate,
                  routeInformationParser:
                      MyRouter.router.routeInformationParser,
                  routeInformationProvider:
                      MyRouter.router.routeInformationProvider,
                )));
  }
}
