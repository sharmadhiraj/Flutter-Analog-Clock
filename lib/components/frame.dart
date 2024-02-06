import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/util/constants.dart';

class ClockFrame extends StatelessWidget {
  const ClockFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        width: Constant.clockSize,
        height: Constant.clockSize,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.red,
            width: 4,
          ),
        ),
      ),
    );
  }
}
