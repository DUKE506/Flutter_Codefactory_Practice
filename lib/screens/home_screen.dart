import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/component/calendar.dart';
import 'package:flutter_codefactory_practice/component/schedule_card.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container(
                    // color: Colors.white,
                    // // height: 600,
                    // child: Column(
                    //   children: [],
                    // ),
                    );
              });
        },
        backgroundColor: primatyColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ScheduleCard(
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(Duration(hours: 1)),
                    content: '안녕하세요.',
                    color: Colors.red,
                  )
                ],
              ),
            ),
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
