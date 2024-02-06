import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/components/hand.dart';

class ClockFaceWidget extends StatefulWidget {
  const ClockFaceWidget({super.key});

  @override
  State<ClockFaceWidget> createState() => _ClockFaceWidgetState();
}

class _ClockFaceWidgetState extends State<ClockFaceWidget> {
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
    return Stack(
      children: [
        _buildMinuteHand(),
        _buildHourHand(),
        _buildSecondHand(),
      ],
    );
  }

  Widget _buildSecondHand() {
    return HandWidget(
      color: Colors.red,
      length: 0.75,
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
      angleRadians: _currentTime.minute * 2 * 3.14159 / 60,
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
