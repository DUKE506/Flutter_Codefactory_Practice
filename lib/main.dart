import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/screens/home_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      routes: {
        ///key 라우트 이름
        ///value - builder->이동하고싶은 라우트
        '/': (context) => HomeScreen(),
      },
    ),
  );
}
