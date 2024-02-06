import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/util/constants.dart';

class HandWidget extends StatelessWidget {
  const HandWidget({
    required this.color,
    required this.length,
    required this.width,
    required this.angleRadians,
    this.tip = 0,
    super.key,
  });

  final Color color;
  final double length;
  final double width;
  final double tip;
  final double angleRadians;

  @override
  Widget build(BuildContext context) {
    final double handSize = Constant.clockSize * length;
    return Center(
      child: Transform.rotate(
        angle: angleRadians,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width,
              height: handSize * (0.5 + tip),
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            SizedBox(
              width: 2,
              height: handSize * (0.5 - tip),
            ),
          ],
        ),
      ),
    );
  }
}
