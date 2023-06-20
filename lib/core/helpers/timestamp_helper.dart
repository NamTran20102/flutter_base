import 'package:intl/intl.dart';

class TimeStampHelper {
  String timestampToDate({
    required int timestamp,
    required String dateFormat,
  }) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateFormat format = DateFormat(dateFormat);
    return format.format(dateTime);
  }

  DateTime timestampToDateTime({required int timestamp}) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  int dateTimeToTimestamp({required DateTime dateTime}) {
    return dateTime.millisecondsSinceEpoch;
  }
}
