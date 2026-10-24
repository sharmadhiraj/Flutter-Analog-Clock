import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/painters/clock_face_painter.dart';
import 'package:flutter_analog_clock/painters/clock_hands_painter.dart';
import 'package:flutter_analog_clock/theme/clock_palette.dart';
import 'package:flutter_analog_clock/utils/clock_ticker.dart';
import 'package:flutter_analog_clock/utils/time_format.dart';

class AnalogClock extends StatelessWidget {
  const AnalogClock({required this.ticker, super.key});

  final ClockTicker ticker;

  @override
  Widget build(BuildContext context) {
    final ClockPalette palette = ClockPalette.of(context);
    return ValueListenableBuilder<DateTime>(
      valueListenable: ticker.second,
      builder: (context, second, child) => Semantics(
        label: "Analog clock, ${TimeFormat.hourMinute(second)}",
        image: true,
        child: child,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            RepaintBoundary(
              child: CustomPaint(painter: ClockFacePainter(palette: palette)),
            ),
            RepaintBoundary(
              child: CustomPaint(
                painter: ClockHandsPainter(
                  time: ticker.frame,
                  palette: palette,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
