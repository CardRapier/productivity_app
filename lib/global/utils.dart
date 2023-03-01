import 'package:intl/intl.dart';

class Utils {
  static formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static getDailyDate() {
    final now = DateTime.now();
    return formatDate(now);
  }
}
