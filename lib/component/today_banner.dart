import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/const/const.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int taskCount;

  const TodayBanner({
    super.key,
    required this.selectedDay,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );

    return Container(
      color: primatyColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${selectedDay.year}년 ${selectedDay.month}월${selectedDay.day}일',
            style: defaultTextStyle,
          ),
          Text(
            taskCount.toString(),
            style: defaultTextStyle,
          ),
        ],
      ),
    );
  }
}
