import 'package:flutter/material.dart';

class ClockCenter extends StatelessWidget {
  const ClockCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 12,
        height: 12,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
