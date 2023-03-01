import 'package:flutter/material.dart';
import 'package:productivity_app/modules/habits/habits_repo.dart';
import 'package:productivity_app/modules/habits/models/habit.dart';
import 'package:productivity_app/modules/habits/models/habit_daily.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HabitsProvider extends ChangeNotifier {
  late List<HabitDaily> habits = [];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final createForm = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'unit': FormControl<String>(),
    'desired': FormControl<int>(validators: [Validators.number]),
    'value': FormControl<int>(validators: [Validators.number]),
  });

  HabitsProvider() {
    reloadInfo();
  }

  reloadInfo() async {
    await HabitsRepository.generateDailyHabits();
    habits = await HabitsRepository.getDailyHabits();
    notifyListeners();
  }

  createHabit() async {
    var newHabit = Habit()
      ..name = createForm.control('name').value
      ..unit = createForm.control('unit').value ?? ''
      ..desired = createForm.control('desired').value ?? 1;
    await HabitsRepository.createHabit(newHabit);
    await HabitsRepository.generateDailyHabits();
    habits = await HabitsRepository.getDailyHabits();
    createForm.resetState({});
    notifyListeners();
  }

  progressInHabit(HabitDaily habit) async {
    if (habit.habit.value!.desired > habit.value) habit.value++;
    if (habit.status == Status.inProgress &&
        habit.habit.value?.desired == habit.value) {
      habit.status = Status.done;
    }
    await HabitsRepository.progressInHabit(habit);
    notifyListeners();
  }
}
