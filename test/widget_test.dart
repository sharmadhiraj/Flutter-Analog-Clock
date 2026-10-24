import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/app.dart';
import 'package:flutter_analog_clock/utils/clock_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("hand angles at 03:00:00", () {
    final ClockTime clock = ClockTime(DateTime(2026, 1, 1, 3));
    expect(clock.hourAngle, closeTo(3.14159265 / 2, 1e-6));
    expect(clock.minuteAngle, 0);
    expect(clock.secondAngle, 0);
  });

  testWidgets("toggles theme", (tester) async {
    await tester.pumpWidget(const AnalogClockApp());
    expect(find.bySemanticsLabel(RegExp("Analog clock")), findsOneWidget);

    final Brightness before =
        Theme.of(tester.element(find.byType(Scaffold))).brightness;
    await tester.tap(find.byType(IconButton));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final Brightness after =
        Theme.of(tester.element(find.byType(Scaffold))).brightness;
    expect(after, isNot(before));
  });

  testWidgets("clock keeps ticking", (tester) async {
    await tester.pumpWidget(const AnalogClockApp());
    final Finder time = find.textContaining(RegExp(r"^\d\d:\d\d:\d\d$"));
    final String before = tester.widget<Text>(time).data!;
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 1100)),
    );
    await tester.pump(const Duration(milliseconds: 16));
    expect(tester.widget<Text>(time).data, isNot(before));
  });
}
