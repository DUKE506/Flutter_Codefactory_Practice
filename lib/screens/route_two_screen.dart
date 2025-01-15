import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/layout/default_layout.dart';
import 'package:flutter_codefactory_practice/screens/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      children: [
        Text(arguments.toString()),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('pop')),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/three',
                arguments: 11111,
              );
            },
            child: Text('push')),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/three');
            },
            child: Text('push Replace')),
      ],
      title: 'Route Two Screen',
    );
  }
}
