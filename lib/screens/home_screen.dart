import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/constant/color.dart';
import 'package:flutter_codefactory_practice/screens/component/number_to_image.dart';
import 'package:flutter_codefactory_practice/screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];
  int maxNumber = 1000;
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
              _Header(
                onPressed: onSettingIconPressd,
              ),
              _Body(
                numbers: numbers,
              ),
              _Footer(
                onPressed: generateRandomNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSettingIconPressd() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return SettingScreen(
          maxNumber: maxNumber.toDouble(),
        );
      }),
    );
    maxNumber = result;
  }

  generateRandomNumber() {
    final rand = Random();
    final Set<int> newNumber = {};
    while (newNumber.length < 3) {
      final randomNumber = rand.nextInt(maxNumber);
      newNumber.add(randomNumber);
    }

    setState(() {
      numbers = newNumber.toList();
    });
  }
}

class _Header extends StatelessWidget {
  VoidCallback onPressed;
  _Header({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.settings,
              color: redColor,
            ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  List<int> numbers;
  _Body({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: numbers.map((e) => NumberToImage(number: e)).toList()));
  }
}

class _Footer extends StatelessWidget {
  VoidCallback onPressed;
  _Footer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor, foregroundColor: Colors.white),
      child: Text('생성'),
    );
  }
}
