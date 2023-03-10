import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:productivity_app/router/routes_constants.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  const Layout({
    super.key,
    required this.child,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text('Productivity App  😤'),
              ),
            ),
            ListTile(
              title: const Text('Home 🏡'),
              onTap: () => context.goNamed(RoutesConstants.home),
            ),
            ListTile(
              title: const Text('To-do ✅'),
              onTap: () => context.goNamed(RoutesConstants.todo),
            ),
            ListTile(
              title: const Text('Habits tracker ✅'),
              onTap: () => context.goNamed(RoutesConstants.habits),
            )
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: child,
    );
  }
}
