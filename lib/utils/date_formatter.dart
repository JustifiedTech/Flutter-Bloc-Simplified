import 'package:intl/intl.dart';

class DateFormatter {
  static String toDateTime(DateTime dateTime) {
    final date = DateFormat('dd/MM/yyyy').format(dateTime);
    final time = DateFormat.jm().format(dateTime);
    return '$date $time';
  }

  static String toDay(DateTime dateTime) {
    final day = DateFormat.d().format(dateTime);
    final date = DateFormat.yMMM().format(dateTime);

    return '${36}'.formatDate + ' $date';
  }

  static DateTime? parseToDateTime(String dateTime) {
    return DateTime.tryParse(dateTime);
  }

  static String parseToDay(String dateTime) {
    var result = parseToDateTime(dateTime);
    return toDay(result ?? DateTime.now());
  }
}

extension DateExtendion on String {
  get formatDate {
    if (this == '1' || (length > 1 && substring(1, 2) == '1')) {
      return this + 'st';
    }
    if (this == '2' || (length > 1 && substring(1, 2) == '2')) {
      return this + 'nd';
    }
    if (this == '3' || (length > 1 && substring(1, 2) == '3')) {
      return substring(0, 1);
    } else {
      return this + 'th';
    }
  }
}
