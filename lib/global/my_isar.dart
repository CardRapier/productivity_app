import 'package:isar/isar.dart';
import 'package:productivity_app/modules/habits/models/habit.dart';
import 'package:productivity_app/modules/habits/models/habit_daily.dart';

class MyIsar {
  static Isar? _isar;

  static Future<Isar> getIsarInstance() async {
    if (_isar == null) await initializeIsarInstance();
    return _isar!;
  }

  static Future<void> initializeIsarInstance() async {
    _isar = await Isar.open([HabitSchema, HabitDailySchema], inspector: true);
  }
}
