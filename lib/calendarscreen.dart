import "package:flutter/material.dart";
import "package:table_calendar/table_calendar.dart";
import "symptoms_screen.dart";

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PainPal - Kalendarz'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2025, 3, 6),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SymptomsScreen(date: selectedDay),
              ),
            );

            // Na przyszłość: przejście do ekranu szczegółów dnia
            // Navigator.push(...);
          },
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 120, 177),
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: const Color.fromARGB(255, 217, 12, 173),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
