import 'package:flutter/material.dart';
import 'package:selver_apitest1/dio_helper.dart';
import 'main_screen.dart';

void main() {
  // Initialization code
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ManiScreen(),
    );
  }
}
