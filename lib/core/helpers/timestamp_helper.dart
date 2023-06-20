import 'package:intl/intl.dart';

class TimeStampHelper {
  static String timestampToDate({
    required int timestamp,
    required String dateFormat,
  }) {
    final val = timestamp.toString().length == 13 ? timestamp : timestamp * 1000;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(val);
    DateFormat format = DateFormat(dateFormat);
    return format.format(dateTime);
  }

  static DateTime timestampToDateTime({required int timestamp}) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  static int dateTimeToTimestamp({required DateTime dateTime}) {
    return dateTime.millisecondsSinceEpoch;
  }
}
