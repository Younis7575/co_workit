// // calendar_controller.dart
// import 'package:co_workit/models/event.dart'; 
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';  


// class BookingController extends GetxController {
//   var focusedDay = DateTime.now().obs;
//   var selectedDays = <DateTime>[].obs;
//   var selectedEvents = <Event>[].obs;
//   var calendarFormat = CalendarFormat.month.obs;
//   var rangeSelectionMode = RangeSelectionMode.toggledOff.obs;
//   var rangeStart = DateTime.now().obs;
//   var rangeEnd = DateTime.now().obs;
//   var pageController = PageController();

//   List<Event> getEventsForDay(DateTime day) {
//     return kEvents[day] ?? [];
//   }

//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(this.focusedDay.value, selectedDay)) {
//       this.focusedDay.value = focusedDay;
//       selectedDays.value = [selectedDay];
//       selectedEvents.value = getEventsForDay(selectedDay);
//     }
//   }

//   void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     rangeStart.value = start ?? focusedDay;
//     rangeEnd.value = end ?? focusedDay;
//     focusedDay = focusedDay;
//     selectedEvents.value = getEventsForDay(start ?? focusedDay);
//   }

//   void goToToday() {
//     focusedDay.value = DateTime.now();
//     selectedDays.clear();
//     selectedEvents.clear();
//   }

//   void clearSelection() {
//     selectedDays.clear();
//     selectedEvents.clear();
//   }

//   void addEvent(Event event) {
//     final events = kEvents[event.date] ?? [];
//     events.add(event);
//     kEvents[event.date] = events;
//     selectedEvents.value = getEventsForDay(event.date);
//   }

 
//   // var selectedEvents = <Event>[].obs;

//   // void addEvent(Event event) {
//   //   selectedEvents.add(event);
//   // }

//   void removeEvent(Event event) {
//     selectedEvents.remove(event);
//   }

//   void updateEvent(Event oldEvent, Event newEvent) {
//     int index = selectedEvents.indexOf(oldEvent);
//     if (index != -1) {
//       selectedEvents[index] = newEvent;
//     }
//   }

//   // List<Event> getEventsForDay(DateTime day) {
//   //   return selectedEvents.where((event) => isSameDay(event.date, day)).toList();
//   // }
 




//   bool get canClearSelection => selectedDays.isNotEmpty || selectedEvents.isNotEmpty;
// }



import 'package:co_workit/models/event.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDays = <DateTime>[].obs;
  var selectedEvents = <Event>[].obs;
  var calendarFormat = CalendarFormat.month.obs;
  var rangeSelectionMode = RangeSelectionMode.toggledOff.obs;
  var rangeStart = DateTime.now().obs;
  var rangeEnd = DateTime.now().obs;
  var pageController = PageController();

  Map<DateTime, List<Event>> kEvents = {};

  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.focusedDay.value, selectedDay)) {
      this.focusedDay.value = focusedDay;
      selectedDays.value = [selectedDay];
      selectedEvents.value = getEventsForDay(selectedDay);
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    rangeStart.value = start ?? focusedDay;
    rangeEnd.value = end ?? focusedDay;
    this.focusedDay.value = focusedDay;
    selectedEvents.value = getEventsForDay(start ?? focusedDay);
  }

  void goToToday() {
    focusedDay.value = DateTime.now();
    selectedDays.clear();
    selectedEvents.clear();
  }

  void clearSelection() {
    selectedDays.clear();
    selectedEvents.clear();
  }

  void addEvent(Event event) {
    final events = kEvents[event.date] ?? [];
    events.add(event);
    kEvents[event.date] = events;
    selectedEvents.value = getEventsForDay(event.date);
  }

  void removeEvent(Event event) {
    final events = kEvents[event.date];
    if (events != null) {
      events.remove(event);
      kEvents[event.date] = events;
      selectedEvents.value = getEventsForDay(event.date);
    }
  }

  void updateEvent(Event oldEvent, Event newEvent) {
    final events = kEvents[oldEvent.date];
    if (events != null) {
      final index = events.indexOf(oldEvent);
      if (index != -1) {
        events[index] = newEvent;
        kEvents[oldEvent.date] = events;
        selectedEvents.value = getEventsForDay(oldEvent.date);
      }
    }
  }

  bool get canClearSelection => selectedDays.isNotEmpty || selectedEvents.isNotEmpty;
}

