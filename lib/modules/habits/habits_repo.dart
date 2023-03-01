import 'package:isar/isar.dart';
import 'package:productivity_app/global/my_isar.dart';
import 'package:productivity_app/global/utils.dart';
import 'package:productivity_app/modules/habits/models/habit.dart';
import 'package:productivity_app/modules/habits/models/habit_daily.dart';
import 'package:collection/collection.dart';
class HabitsRepository {
  static Future<List<HabitDaily>> getDailyHabits() async {
    final isar = await MyIsar.getIsarInstance();
    return await isar.habitDailys.where().findAll();
  }

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

  static progressInHabit(HabitDaily habit) async {
    final isar = await MyIsar.getIsarInstance();
    await isar.writeTxn(() async {
      await isar.habitDailys.put(habit);
    });
  }

  static generateDailyHabits() async {
    final isar = await MyIsar.getIsarInstance();
    final habits = await isar.habits.where().findAll();
    final now = Utils.getDailyDate();
    final dailyHabits =
        await isar.habitDailys.where().filter().dayEqualTo(now).findAll();
    if (!(dailyHabits.length == habits.length)) {
      for (var habit in habits) {
        final exists = dailyHabits
            .firstWhereOrNull((d) => d.habit.value?.name == habit.name);
        if (exists == null) {
          await isar.writeTxn(() async {
            final newHabit = HabitDaily()..habit.value = habit;
            await isar.habitDailys.put(newHabit);
            await newHabit.habit.save();
          });
        }
      }
    }
  }
}
