import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/screens/home_screen.dart';
import 'package:flutter_codefactory_practice/screens/route_one_screen.dart';
import 'package:flutter_codefactory_practice/screens/route_three_screen.dart';
import 'package:flutter_codefactory_practice/screens/route_two_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      routes: {
        ///key 라우트 이름
        ///value - builder->이동하고싶은 라우트
        '/': (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(
              number: 1,
            ),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
