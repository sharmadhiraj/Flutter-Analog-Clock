import 'dart:math' as math;

class ClockTime {
  const ClockTime(this.time);

  static const double _fullTurn = 2 * math.pi;

  final DateTime time;

  double get secondAngle =>
      (time.second + time.millisecond / 1000) / 60 * _fullTurn;

  double get minuteAngle => (time.minute + time.second / 60) / 60 * _fullTurn;

  double get hourAngle => (time.hour % 12 + time.minute / 60) / 12 * _fullTurn;
}
