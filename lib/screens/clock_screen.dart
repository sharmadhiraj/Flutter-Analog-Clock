import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_analog_clock/utils/clock_ticker.dart';
import 'package:flutter_analog_clock/widgets/analog_clock.dart';
import 'package:flutter_analog_clock/widgets/digital_readout.dart';
import 'package:flutter_analog_clock/widgets/theme_toggle_button.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({required this.onToggleTheme, super.key});

  final ValueChanged<Brightness> onToggleTheme;

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen>
    with SingleTickerProviderStateMixin {
  static const double _maxClockSize = 420;

  final ClockTicker _clockTicker = ClockTicker();
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_clockTicker.tick)..start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [ThemeToggleButton(onToggle: widget.onToggleTheme)],
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxClockSize),
              child: AnalogClock(ticker: _clockTicker),
            ),
            const SizedBox(height: 32),
            DigitalReadout(ticker: _clockTicker),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    _clockTicker.dispose();
    super.dispose();
  }
}
