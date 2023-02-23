import 'package:flutter/material.dart';
import 'package:productivity_app/global/components/layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      child: Center(
        child: Text('Welcome to productivity app 🌠'),
      ),
    );
  }
}
