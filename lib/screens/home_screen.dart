import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/component/calendar.dart';
import 'package:flutter_codefactory_practice/component/today_banner.dart';
import 'package:flutter_codefactory_practice/const/const.dart';
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
          child: Column(
        children: [
          Calendar(
            focusedDay: DateTime.now(),
            onDaySelected: onDaySelected,
            selectedDayPredicate: selectedDayPredicate,
          ),
          TodayBanner(
            selectedDay: selectedDay,
            taskCount: 1,
          ),
          Expanded(
            child: ListView(),
          ),
        ],
      )),
    );
  }

  onDaySelected(selectedDay, focusedDay) {
    setState(() {
      this.selectedDay = focusedDay;
    });
  }

  bool selectedDayPredicate(day) {
    if (selectedDay == null) {
      return false;
    }
    return day == this.selectedDay;
  }
}
