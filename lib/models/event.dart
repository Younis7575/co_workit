import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final DateTime date;
  final String title;
  final String startTime;
  final String endTime;
    final String company;

  Event({
    required this.date,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.company,
  });

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event(
            title: 'Event $item | ${index + 1}',
            date: DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
            startTime: '09:00 AM',
            endTime: '10:00 AM', company: 'Karobar',
        )))
  ..addAll({
    kToday: [
      Event(
          title: 'Today\'s Event 1',
          date: kToday,
          startTime: '09:00 AM',
          endTime: '10:00 AM',
          company: 'Karobar',
      ),
      Event(
          title: 'Today\'s Event 2',
          date: kToday,
          startTime: '11:00 AM',
          endTime: '12:00 PM',
          company: 'Karobar',
      ),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
