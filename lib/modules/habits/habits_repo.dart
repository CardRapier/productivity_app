import 'package:isar/isar.dart';
import 'package:productivity_app/global/my_isar.dart';
import 'package:productivity_app/modules/habits/models/habit.dart';

class HabitsRepository {
  static Future<List<Habit>> getHabits() async {
    final isar = await MyIsar.getIsarInstance();
    return await isar.habits.where().findAll();
  }

  static createHabit(Habit habit) async {
    final isar = await MyIsar.getIsarInstance();
    await isar.writeTxn(() async {
      await isar.habits.put(habit);
    });
  }
}
