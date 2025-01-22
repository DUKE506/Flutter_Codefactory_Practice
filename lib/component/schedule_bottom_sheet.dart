import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/component/custom_text_field.dart';
import 'package:flutter_codefactory_practice/const/const.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
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
          child: Column(
            children: [
              _Time(),
              SizedBox(
                height: 8,
              ),
              _Content(),
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
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  selectColor(String color) {
    setState(() {
      selectedColor = color;
    });
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
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
                  onTap(selectedColor);
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
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomTextField(
      label: '내용',
      expand: true,
    ));
  }
}

class _Time extends StatelessWidget {
  const _Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
          ),
        ),
      ],
    );
  }
}
