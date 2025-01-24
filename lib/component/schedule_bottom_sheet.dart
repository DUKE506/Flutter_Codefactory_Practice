import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/component/custom_text_field.dart';
import 'package:flutter_codefactory_practice/const/const.dart';
import 'package:flutter_codefactory_practice/model/schedule.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDay;
  const ScheduleBottomSheet({
    super.key,
    required this.selectedDay,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int? startTime;
  int? endTime;
  String? content;
  String selectedColor = categoryColors.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 16,
            bottom: 16,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _Time(
                  onStartSaved: onStartTimeSaved,
                  onEndSaved: onEndTimeSaved,
                  onStartValidate: onStartTimeValidate,
                  onEndValidate: onEndTimeValidate,
                ),
                SizedBox(
                  height: 8,
                ),
                _Content(
                  onSaved: onContentSaved,
                  onValidate: onContentValidate,
                ),
                SizedBox(
                  height: 8,
                ),
                _Categories(
                  selectedColor: selectedColor,
                  onTap: selectColor,
                ),
                SizedBox(
                  height: 8,
                ),
                _SaveButton(
                  onPressed: onSavePressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStartTimeSaved(String? val) {
    if (val == null) {
      return;
    }
    startTime = int.parse(val);
  }

  String? onStartTimeValidate(String? val) {
    if (val == null) {
      return '시작 시간을 입력해주세요!';
    }
    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요!';
    }

    final time = int.parse(val);
    if (time >= 24 || time < 0) {
      return '0과 23 사이의 숫자를 입력해주세요!';
    }
  }

  void onEndTimeSaved(String? val) {
    if (val == null) {
      return;
    }

    endTime = int.parse(val);
  }

  String? onEndTimeValidate(String? val) {
    if (val == null) {
      return '마감 시간을 입력해주세요!';
    }

    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요!';
    }
    final time = int.parse(val);
    if (time >= 24 || time < 0) {
      return '0과 23 사이의 숫자를 입력해주세요!';
    }
  }

  void onContentSaved(String? val) {
    if (val == null) {
      return;
    }
    content = val;
  }

  String? onContentValidate(String? val) {
    if (val == null) {
      return '내용을 입력해주세요!';
    }
  }

  void onSavePressed() {
    final validated = formKey.currentState!.validate();

    if (validated) {
      formKey.currentState!.save();

      final schedule = ScheduleTable(
          // id: 999,
          // startTime: startTime!,
          // endTime: endTime!,
          // content: content!,
          // color: selectedColor,
          // date: widget.selectedDay.toUtc(),
          // createdAt: DateTime.now().toUtc(),
          );

      Navigator.of(context).pop(schedule);
    }
  }

  selectColor(String color) {
    print('색상변경 : ${color}');
    setState(() {
      selectedColor = color;
    });
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _SaveButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text('저장'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primatyColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

typedef OnColorSelected = void Function(String color);

class _Categories extends StatelessWidget {
  final String selectedColor;
  final OnColorSelected onTap;
  const _Categories({
    super.key,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categoryColors
          .map(
            (colorCode) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  onTap(colorCode);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(int.parse(
                      'FF${colorCode}',
                      radix: 16,
                    )),
                    border: colorCode == selectedColor
                        ? Border.all(
                            color: Colors.black,
                            width: 1,
                          )
                        : null,
                    shape: BoxShape.circle,
                  ),
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> onValidate;
  const _Content({
    super.key,
    required this.onSaved,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomTextField(
      label: '내용',
      expand: true,
      onSaved: onSaved,
      validator: onValidate,
    ));
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final FormFieldValidator<String> onStartValidate;
  final FormFieldValidator<String> onEndValidate;

  const _Time({
    super.key,
    required this.onStartSaved,
    required this.onEndSaved,
    required this.onStartValidate,
    required this.onEndValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            onSaved: onStartSaved,
            validator: onStartValidate,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
            onSaved: onEndSaved,
            validator: onEndValidate,
          ),
        ),
      ],
    );
  }
}
