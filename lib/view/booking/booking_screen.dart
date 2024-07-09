
import 'package:co_workit/constant/custom_text_style.dart';
import 'package:co_workit/controllers/booking_controller.dart';
import 'package:co_workit/models/event.dart';
import 'package:co_workit/view/booking/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.put(BookingController());

    return Scaffold( 
      body: Column(
        children: [
          Obx(() => CalendarHeader(
                focusedDay: controller.focusedDay.value,
                clearButtonVisible: controller.canClearSelection,
                onTodayButtonTap: controller.goToToday,
                onClearButtonTap: controller.clearSelection,
                onLeftArrowTap: () {
                  controller.pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  controller.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              )),
          Obx(() => TableCalendar<Event>(
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.focusedDay.value,
                headerVisible: false,
                selectedDayPredicate: (day) =>
                    controller.selectedDays.contains(day),
                rangeStartDay: controller.rangeStart.value,
                rangeEndDay: controller.rangeEnd.value,
                calendarFormat: controller.calendarFormat.value,
                rangeSelectionMode: controller.rangeSelectionMode.value,
                eventLoader: controller.getEventsForDay,
                holidayPredicate: (day) => day.day == 20,
                onDaySelected: (selectedDay, focusedDay) {
                  controller.onDaySelected(selectedDay, focusedDay);
                  _showAddEventDialog(context, controller, selectedDay);
                },
                onRangeSelected: controller.onRangeSelected,
                onCalendarCreated: (pageController) {
                  controller.pageController = pageController;
                },
                onPageChanged: (focusedDay) =>
                    controller.focusedDay.value = focusedDay,
                onFormatChanged: (format) {
                  if (controller.calendarFormat.value != format) {
                    controller.calendarFormat.value = format;
                  }
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: events.length > 3 ? 4 : events.length,
                          itemBuilder: (context, index) {
                            if (index < 3) {
                              return Container(
                                width: 5.0,
                                height: 5.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0.2),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              );
                            } else {
                              return Container(
                                width: 15.0,
                                height: 5.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0.2),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    '+${events.length - 3}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )),
          const SizedBox(height: 8.0),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.selectedEvents.length,
                  itemBuilder: (context, index) {
                    final event = controller.selectedEvents[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Meetings:',style: CustomTextStyles.headline2,),
                            Text(
                              '${controller.getEventsForDay(event.date).length}',
                            ),
                            Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add,color: Colors.green,),
                              onPressed: () =>
                                  _showEditEventDialog(context, controller, event),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete,color: Colors.red,),
                              onPressed: () {
                                controller.removeEvent(event);
                              },
                            ),
                          ],
                        ),
                          ],
                        ),
                        subtitle: Column(
                        
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Company Name:'),
                                Text(
                                  '${event.company}',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Subject:'),
                                Text(
                                  '${event.title}',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Start Time:'),
                                Text(
                                  '${event.startTime}',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('End Time:'),
                                Text(
                                  '${event.endTime}',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Date:'),
                                Text(
                                  '${DateFormat.yMd().format(event.date)}',
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  void _showAddEventDialog(BuildContext context, BookingController controller,
      DateTime selectedDay) {
    final messageController = TextEditingController();
    final companyNameController = TextEditingController();
    TimeOfDay? _selectedStartTime;
    TimeOfDay? _selectedEndTime;

    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              title: const Text('Create Meeting'),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Write Company name";
                          }
                          return null;
                        },
                        controller: companyNameController,
                        decoration:
                            const InputDecoration(labelText: 'Company Name'),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        title: const Text('Start Time:'),
                        trailing: Text(
                          _selectedStartTime == null
                              ? 'Select Time'
                              : _selectedStartTime!.format(context),
                        ),
                        onTap: () async {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _selectedStartTime = selectedTime;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        title: const Text('End Time:'),
                        trailing: Text(
                          _selectedEndTime == null
                              ? 'Select Time'
                              : _selectedEndTime!.format(context),
                        ),
                        onTap: () async {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _selectedEndTime = selectedTime;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Write Subject";
                          }
                          return null;
                        },
                        controller: messageController,
                        decoration: const InputDecoration(labelText: 'Subject'),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedStartTime == null ||
                          _selectedEndTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Please select start and end times')),
                        );
                        return;
                      }

                      final startTime = _selectedStartTime!.format(context);
                      final endTime = _selectedEndTime!.format(context);
                      final message = messageController.text;
                      final company = companyNameController.text;

                      final event = Event(
                        date: selectedDay,
                        title: message,
                        startTime: startTime,
                        endTime: endTime,
                        company: company,
                      );

                      controller.addEvent(event);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditEventDialog(BuildContext context, BookingController controller,
      Event event) {
    final messageController = TextEditingController(text: event.title);
    final companyNameController = TextEditingController(text: event.company);
    TimeOfDay? _selectedStartTime = _timeOfDayFromString(event.startTime);
    TimeOfDay? _selectedEndTime = _timeOfDayFromString(event.endTime);

    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              title: const Text('Edit Meeting'),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Write Company name";
                          }
                          return null;
                        },
                        controller: companyNameController,
                        decoration:
                            const InputDecoration(labelText: 'Company Name'),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        title: const Text('Start Time:'),
                        trailing: Text(
                          _selectedStartTime == null
                              ? 'Select Time'
                              : _selectedStartTime!.format(context),
                        ),
                        onTap: () async {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _selectedStartTime = selectedTime;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        title: const Text('End Time:'),
                        trailing: Text(
                          _selectedEndTime == null
                              ? 'Select Time'
                              : _selectedEndTime!.format(context),
                        ),
                        onTap: () async {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _selectedEndTime = selectedTime;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Write Subject";
                          }
                          return null;
                        },
                        controller: messageController,
                        decoration: const InputDecoration(labelText: 'Subject'),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedStartTime == null ||
                          _selectedEndTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please select start and end times')),
                        );
                        return;
                      }

                      final startTime = _selectedStartTime!.format(context);
                      final endTime = _selectedEndTime!.format(context);
                      final message = messageController.text;
                      final company = companyNameController.text;

                      final updatedEvent = Event(
                        date: event.date,
                        title: message,
                        startTime: startTime,
                        endTime: endTime,
                        company: company,
                      );

                      controller.updateEvent(event, updatedEvent);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  TimeOfDay _timeOfDayFromString(String time) {
    try {
      final format = DateFormat.jm();
      return TimeOfDay.fromDateTime(format.parse(time));
    } catch (e) {
      return TimeOfDay(hour: 0, minute: 0); // Return a default time in case of error
    }
  }
}
