import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/const/const.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;

  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: primatyColor,
      fontSize: 16.0,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primatyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${startTime.toString().padLeft(2, '0')}:00',
                    style: defaultTextStyle,
                  ),
                  Text(
                    '${endTime.toString().padLeft(2, '0')}:00',
                    style: defaultTextStyle.copyWith(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Text(content),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
