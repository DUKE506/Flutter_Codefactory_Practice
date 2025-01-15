import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/layout/default_layout.dart';
import 'package:flutter_codefactory_practice/screens/route_one_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        OutlinedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RouteOneScreen(
                    number: 20,
                  );
                },
              ),
            );
            print(result);
          },
          child: Text('Push!'),
        ),
      ],
      title: 'HomeScreen',
    );
  }
}
