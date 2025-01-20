import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/screens/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      routes: {
        ///key 라우트 이름
        ///value - builder->이동하고싶은 라우트
        '/': (context) => HomeScreen(),
      },
    ),
  );
}
