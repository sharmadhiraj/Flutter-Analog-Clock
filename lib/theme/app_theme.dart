import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData light = _build(Brightness.light);
  static final ThemeData dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: brightness,
      ),
      useMaterial3: true,
    );
  }
}
