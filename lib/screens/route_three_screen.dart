import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/layout/default_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

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
          child: Text('pop'),
        )
      ],
      title: 'Route Three Screen',
    );
  }
}
