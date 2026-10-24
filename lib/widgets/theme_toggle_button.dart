import 'package:flutter/material.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({required this.onToggle, super.key});

  final ValueChanged<Brightness> onToggle;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool isDark = brightness == Brightness.dark;
    final String label =
        isDark ? "Switch to light theme" : "Switch to dark theme";
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: IconButton(
        tooltip: label,
        icon:
            Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
        onPressed: () => onToggle(brightness),
      ),
    );
  }
}
