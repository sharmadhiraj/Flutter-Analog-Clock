import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/theme/clock_palette.dart';

class ClockFacePainter extends CustomPainter {
  const ClockFacePainter({required this.palette});

  final ClockPalette palette;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.shortestSide / 2;
    canvas.translate(size.width / 2, size.height / 2);
    _paintDial(canvas, radius);
    _paintTicks(canvas, radius);
    _paintNumerals(canvas, radius);
  }

  void _paintDial(Canvas canvas, double radius) {
    final double rimWidth = radius * 0.03;
    canvas
      ..drawCircle(Offset.zero, radius, Paint()..color = palette.dial)
      ..drawCircle(
        Offset.zero,
        radius - rimWidth / 2,
        Paint()
          ..color = palette.rim
          ..style = PaintingStyle.stroke
          ..strokeWidth = rimWidth,
      );
  }

  void _paintTicks(Canvas canvas, double radius) {
    final Paint paint = Paint()
      ..color = palette.tick
      ..strokeCap = StrokeCap.round;
    final double outer = radius * 0.92;
    for (int minute = 0; minute < 60; minute++) {
      final bool isHour = minute % 5 == 0;
      final double inner = outer - radius * (isHour ? 0.07 : 0.03);
      paint.strokeWidth = radius * (isHour ? 0.025 : 0.012);
      final double angle = minute / 60 * 2 * math.pi;
      canvas.drawLine(
        Offset(math.sin(angle) * inner, -math.cos(angle) * inner),
        Offset(math.sin(angle) * outer, -math.cos(angle) * outer),
        paint,
      );
    }
  }

  void _paintNumerals(Canvas canvas, double radius) {
    final TextStyle style = TextStyle(
      color: palette.numeral,
      fontSize: radius * 0.14,
      fontWeight: FontWeight.w600,
    );
    final double distance = radius * 0.68;
    for (int hour = 1; hour <= 12; hour++) {
      final double angle = hour / 12 * 2 * math.pi;
      final TextPainter text = TextPainter(
        text: TextSpan(text: "$hour", style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      text.paint(
        canvas,
        Offset(
          math.sin(angle) * distance - text.width / 2,
          -math.cos(angle) * distance - text.height / 2,
        ),
      );
      text.dispose();
    }
  }

  @override
  bool shouldRepaint(ClockFacePainter oldDelegate) =>
      oldDelegate.palette != palette;
}
