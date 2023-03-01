import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  String name = '';
  String unit = '';
  int desired = 1;
}
