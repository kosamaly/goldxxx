import 'package:flutter/material.dart';
import 'package:selver_apitest1/dio_helper.dart';
import 'package:selver_apitest1/result.dart';
import 'main_screen.dart';

void main() {
  // Initialization code
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      height: 10,
      width: 10,
    );
  }
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
      initialRoute: "/",
      routes: {
        "/result": (context) => Result(),
      },
      home: const ManiScreen(),
    );
  }
}
