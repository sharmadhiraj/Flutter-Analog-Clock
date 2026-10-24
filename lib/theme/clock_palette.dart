import 'package:flutter/material.dart';

class ClockPalette {
  const ClockPalette({
    required this.dial,
    required this.rim,
    required this.tick,
    required this.numeral,
    required this.hourHand,
    required this.minuteHand,
    required this.secondHand,
  });

  static const ClockPalette light = ClockPalette(
    dial: Color(0xFFFAFAFA),
    rim: Color(0xFF212121),
    tick: Color(0xFF424242),
    numeral: Color(0xFF212121),
    hourHand: Color(0xFF212121),
    minuteHand: Color(0xFF212121),
    secondHand: Color(0xFFE53935),
  );

  static const ClockPalette dark = ClockPalette(
    dial: Color(0xFF111111),
    rim: Color(0xFF26A69A),
    tick: Color(0xFFBDBDBD),
    numeral: Color(0xFFFFFFFF),
    hourHand: Color(0xFFFFFFFF),
    minuteHand: Color(0xFFFFFFFF),
    secondHand: Color(0xFFFF5252),
  );

  final Color dial;
  final Color rim;
  final Color tick;
  final Color numeral;
  final Color hourHand;
  final Color minuteHand;
  final Color secondHand;

  static ClockPalette of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? dark : light;
}
