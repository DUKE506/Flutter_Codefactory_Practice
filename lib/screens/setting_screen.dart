import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Number extends StatelessWidget {
  double maxNumber;
  _Number({super.key, required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Row(
        children: maxNumber
            .toInt()
            .toString()
            .split('')
            .map((number) => Image.asset(
                  'asset/img/${number}.png',
                  width: 30,
                ))
            .toList(),
      )),
    );
  }
}

class _Slider extends StatelessWidget {
  const _Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {Navigator.of(context).pop()},
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor, foregroundColor: Colors.white),
      child: Text('저장'),
    );
  }
}
