import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/screens/home.dart';
import 'package:flutter_analog_clock/util/constants.dart';

void main() {
  runApp(const AnalogClockApp());
}

class AnalogClockApp extends StatelessWidget {
  const AnalogClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
