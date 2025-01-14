import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/layout/default_layout.dart';

class RouteOneScreent extends StatelessWidget {
  const RouteOneScreent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop!'),
        )
      ],
      title: 'Route One Screen',
    );
  }
}
