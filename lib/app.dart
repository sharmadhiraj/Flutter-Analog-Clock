import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/screens/clock_screen.dart';
import 'package:flutter_analog_clock/theme/app_theme.dart';

class AnalogClockApp extends StatefulWidget {
  const AnalogClockApp({super.key});

  @override
  State<AnalogClockApp> createState() => _AnalogClockAppState();
}

class _AnalogClockAppState extends State<AnalogClockApp> {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, mode, child) => MaterialApp(
        title: "Analog Clock",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: mode,
        home: child,
      ),
      child: ClockScreen(
        onToggleTheme: (brightness) => _themeMode.value =
            brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
      ),
    );
  }

  @override
  void dispose() {
    _themeMode.dispose();
    super.dispose();
  }
}
