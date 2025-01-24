import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/component/calendar.dart';
import 'package:flutter_codefactory_practice/component/custom_text_field.dart';
import 'package:flutter_codefactory_practice/component/schedule_bottom_sheet.dart';
import 'package:flutter_codefactory_practice/component/schedule_card.dart';
import 'package:flutter_codefactory_practice/component/today_banner.dart';
import 'package:flutter_codefactory_practice/const/const.dart';
import 'package:flutter_codefactory_practice/model/schedule.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Map<DateTime, List<ScheduleTable>> schedules = {
  DateTime.utc(2025, 1, 22): [
    // Schedule(
    //   id: 1,
    //   startTime: 11,
    //   endTime: 12,
    //   content: '플러터 공부',
    //   date: DateTime.utc(2025, 1, 22),
    //   color: categoryColors.first,
    //   createdAt: DateTime.now().toUtc(),
    // ),
    // Schedule(
    //   id: 2,
    //   startTime: 14,
    //   endTime: 15,
    //   content: '게임',
    //   date: DateTime.utc(2025, 1, 22),
    //   color: categoryColors[3],
    //   createdAt: DateTime.now().toUtc(),
    // ),
  ]
};

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await showModalBottomSheet<ScheduleTable>(
              context: context,
              builder: (_) {
                return ScheduleBottomSheet(
                  selectedDay: selectedDay,
                );
              });
          if (res == null) {
            return;
          }
          setState(() {
            schedules = {
              ...schedules,
              // res.date: [
              //   if (schedules.containsKey(res.date)) ...schedules[res.date]!,
              //   res
              // ]
            };
            print(res.content);
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
              child: ListView.separated(
                itemCount: schedules.containsKey(selectedDay)
                    ? schedules[selectedDay]!.length
                    : 0,
                itemBuilder: (context, index) {
                  //위젯반환
                  final selectedSchedules = schedules[selectedDay]!;
                  final scheduleModel = selectedSchedules[index];

                  return ScheduleCard(
                    startTime: 12,
                    endTime: 13,
                    content: 'test',
                    color: Color(
                      int.parse('FF${scheduleModel.color}', radix: 16),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
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
