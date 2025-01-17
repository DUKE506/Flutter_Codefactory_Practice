import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          focusedDay: selectedDay,
          firstDay: DateTime(1800),
          lastDay: DateTime(3000),
          onDaySelected: (selectedDay, focusedDay) => {
            setState(() {
              this.selectedDay = focusedDay;
            }),
          },
          selectedDayPredicate: (day) {
            if (selectedDay == null) {
              return false;
            }
            return day == this.selectedDay;
          },
        ),
      ),
    );
  }
}
