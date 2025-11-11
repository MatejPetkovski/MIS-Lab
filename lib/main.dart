import 'package:flutter/material.dart';
import 'package:exam_schedule_app/screens/home.dart';
import 'package:exam_schedule_app/screens/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Распоред за испити - 201249'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}