import 'package:flutter/foundation.dart';

class ClockTicker {
  final ValueNotifier<DateTime> frame = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> second =
      ValueNotifier(_truncate(DateTime.now()));

  static DateTime _truncate(DateTime time) => DateTime(
        time.year,
        time.month,
        time.day,
        time.hour,
        time.minute,
        time.second,
      );

  void tick(Duration elapsed) {
    final DateTime now = DateTime.now();
    frame.value = now;
    second.value = _truncate(now);
  }

  void dispose() {
    frame.dispose();
    second.dispose();
  }
}
