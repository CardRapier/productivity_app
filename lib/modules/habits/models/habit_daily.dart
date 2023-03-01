import 'package:isar/isar.dart';
import 'package:productivity_app/global/utils.dart';
import 'package:productivity_app/modules/habits/models/habit.dart';

part 'habit_daily.g.dart';

@collection
class HabitDaily {
  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;
  int value = 0;
  String day = Utils.getDailyDate();

  @enumerated
  Status status = Status.inProgress;

  var habit = IsarLink<Habit>();
}

enum Status { inProgress, done, unavailable }
