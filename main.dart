import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tire_repair/tire_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tire Inspection Report',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Lexend'),
        ),
      ),
      home: TireInspectionReport(),
    );
  }
}
