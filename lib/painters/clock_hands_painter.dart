import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/theme/clock_palette.dart';
import 'package:flutter_analog_clock/utils/clock_time.dart';

class ClockHandsPainter extends CustomPainter {
  ClockHandsPainter({required this.time, required this.palette})
      : super(repaint: time);

  final ValueListenable<DateTime> time;
  final ClockPalette palette;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.shortestSide / 2;
    final ClockTime clock = ClockTime(time.value);
    canvas.translate(size.width / 2, size.height / 2);

    _paintHand(
      canvas,
      angle: clock.hourAngle,
      length: radius * 0.5,
      width: radius * 0.04,
      color: palette.hourHand,
    );
    _paintHand(
      canvas,
      angle: clock.minuteAngle,
      length: radius * 0.75,
      width: radius * 0.03,
      color: palette.minuteHand,
    );
    _paintHand(
      canvas,
      angle: clock.secondAngle,
      length: radius * 0.82,
      tail: radius * 0.15,
      width: radius * 0.012,
      color: palette.secondHand,
    );
    _paintCenterCap(canvas, radius);
  }

  void _paintHand(
    Canvas canvas, {
    required double angle,
    required double length,
    required double width,
    required Color color,
    double tail = 0,
  }) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
    final double sin = math.sin(angle);
    final double cos = math.cos(angle);
    canvas.drawLine(
      Offset(-sin * tail, cos * tail),
      Offset(sin * length, -cos * length),
      paint,
    );
  }

  void _paintCenterCap(Canvas canvas, double radius) {
    canvas
      ..drawCircle(
        Offset.zero,
        radius * 0.05,
        Paint()..color = palette.secondHand,
      )
      ..drawCircle(
        Offset.zero,
        radius * 0.02,
        Paint()..color = palette.dial,
      );
  }

  @override
  bool shouldRepaint(ClockHandsPainter oldDelegate) =>
      oldDelegate.palette != palette || oldDelegate.time != time;
}
