import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/components/hand.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => setState(() => _currentTime = DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _buildMinuteHand(),
          _buildHourHand(),
          _buildSecondHand(),
        ],
      ),
    );
  }

  Widget _buildSecondHand() {
    return HandWidget(
      color: Colors.red,
      length: 0.8,
      width: 2,
      tip: 0.1,
      angleRadians: _currentTime.second * 2 * 3.14159 / 60,
    );
  }

  Widget _buildMinuteHand() {
    return HandWidget(
      color: Colors.white,
      length: 0.65,
      width: 6,
      angleRadians: _currentTime.hour * 2 * 3.14159 / 60,
    );
  }

  Widget _buildHourHand() {
    return HandWidget(
      color: Colors.white,
      length: 0.5,
      width: 6,
      angleRadians: (_currentTime.hour % 12 + _currentTime.minute / 60) *
          2 *
          3.14159 /
          12,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
