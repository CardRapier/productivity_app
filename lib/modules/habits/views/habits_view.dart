import 'package:flutter/material.dart';
import 'package:productivity_app/global/components/layout.dart';
import 'package:productivity_app/modules/habits/models/habit_daily.dart';
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
          title: Text('${habitsProvider.habits[index].habit.value?.name}'),
          trailing: habitsProvider.habits[index].status == Status.inProgress
              ? Text(
                  '${habitsProvider.habits[index].value}/${habitsProvider.habits[index].habit.value?.desired}')
              : const Icon(Icons.check),
          leading: const Icon(Icons.brush),
          onTap: () async => await habitsProvider
              .progressInHabit(habitsProvider.habits[index]),
        ),
        childCount: habitsProvider.habits.length,
      )),
    ]));
  }
}
