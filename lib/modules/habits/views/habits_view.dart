import 'package:flutter/material.dart';
import 'package:productivity_app/global/components/layout.dart';
import 'package:productivity_app/modules/habits/providers/habits_provider.dart';
import 'package:provider/provider.dart';

class HabitsView extends StatelessWidget {
  late HabitsProvider habitsProvider;
  HabitsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    habitsProvider = Provider.of<HabitsProvider>(context);
    return Layout(
        child: CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
            title: Text('${habitsProvider.habits[index].name}'),
            trailing: Text(
                '${habitsProvider.habits[index].value}/${habitsProvider.habits[index].desired}'),
            leading: Icon(Icons.brush)),
        childCount: habitsProvider.habits.length,
      )),
    ]));
  }
}
