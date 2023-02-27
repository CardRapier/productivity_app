import 'package:flutter/material.dart';
import 'package:productivity_app/global/components/layout.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      child: Center(
        child: Text('Todo View ✅'),
      ),
    );
  }
}
