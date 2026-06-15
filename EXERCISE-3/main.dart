import 'package:flutter/material.dart';
import 'package:w6_practice/EXERCISE-3/ui/screens/temperature_screen.dart';

import 'ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _start = false;

  void StartCovert() {
    setState(() {
      _start = !_start;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _start
              ? TemperatureScreen()
              : WelcomeScreen(start: StartCovert),
        ),
      ),
    );
  }
}

void main() {
  runApp(TemperatureApp());
}
