import 'package:flutter/material.dart';
import 'package:productivity_app/modules/habits/habits_repo.dart';
import 'package:productivity_app/modules/habits/models/habit.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HabitsProvider extends ChangeNotifier {
  late List<Habit> habits = [];
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

  initState() {
    reloadInfo();
  }

  reloadInfo() async {
    habits = await HabitsRepository.getHabits();
    notifyListeners();
  }

  createHabit() async {
    var newHabit = Habit()
      ..name = createForm.control('name').value
      ..unit = createForm.control('unit').value ?? ''
      ..desired = createForm.control('desired').value ?? 1
      ..value = 0;
    await HabitsRepository.createHabit(newHabit);
    habits = await HabitsRepository.getHabits();
    notifyListeners();
  }
}
