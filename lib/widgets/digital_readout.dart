import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/utils/clock_ticker.dart';
import 'package:flutter_analog_clock/utils/time_format.dart';

class DigitalReadout extends StatelessWidget {
  const DigitalReadout({required this.ticker, super.key});

  final ClockTicker ticker;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: ticker.second,
      builder: (context, time, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTime(context, time),
          const SizedBox(height: 4),
          _buildDate(context, time),
        ],
      ),
    );
  }

  Widget _buildTime(BuildContext context, DateTime time) {
    return Text(
      TimeFormat.hourMinuteSecond(time),
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        fontFeatures: const [FontFeature.tabularFigures()],
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildDate(BuildContext context, DateTime time) {
    return Text(
      TimeFormat.date(time),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }
}
