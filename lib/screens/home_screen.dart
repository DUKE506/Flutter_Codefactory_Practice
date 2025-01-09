import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              _Header(),
              _Body(),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

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
            onPressed: () => {},
            icon: Icon(
              Icons.settings,
              color: redColor,
            ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ]
          .map((e) => Row(
                children: e
                    .map((number) => Text(
                          number.toString(),
                          style: TextStyle(color: Colors.white),
                        ))
                    .toList(),
              ))
          .toList(),
    ));
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor, foregroundColor: Colors.white),
      child: Text('생성'),
    );
  }
}
