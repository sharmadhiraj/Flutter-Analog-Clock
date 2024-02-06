import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/components/center.dart';
import 'package:flutter_analog_clock/components/face.dart';
import 'package:flutter_analog_clock/components/frame.dart';
import 'package:flutter_analog_clock/components/maker.dart';
import 'package:flutter_analog_clock/util/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: SizedBox(
        width: Constant.clockSize,
        height: Constant.clockSize,
        child: Stack(
          children: [
            ClockFrame(),
            HourMarkers(),
            ClockFaceWidget(),
            ClockCenter(),
          ],
        ),
      ),
    );
  }
}
