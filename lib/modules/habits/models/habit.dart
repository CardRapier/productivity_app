import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  String? name;
  String? unit;
  int? value;
  int? desired;

  @enumerated
  Status status = Status.unavailable;
}

enum Status { inProgress, done, unavailable }
