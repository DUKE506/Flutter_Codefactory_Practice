import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  int number;
  NumberToImage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toInt()
          .toString()
          .split('')
          .map((number) => Image.asset(
                'asset/img/${number}.png',
                width: 30,
              ))
          .toList(),
    );
  }
}
