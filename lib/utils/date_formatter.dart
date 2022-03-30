import 'package:intl/intl.dart';

class DateFormatter {
  static String toDateTime(DateTime dateTime) {
    final date = DateFormat('dd/MM/yyyy').format(dateTime);
    final time = DateFormat.jm().format(dateTime);
    return '$date $time';
  }

  static String toDay(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }


  static DateTime parseToDateTime(String dateTime) {
    return DateTime.parse(dateTime);
  }


  static String parseToDay(String dateTime) {
    var result = parseToDateTime(dateTime);
    return toDay(result);
  }

}
