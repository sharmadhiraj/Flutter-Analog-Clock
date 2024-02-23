import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/util/constants.dart';

class HourMarkers extends StatelessWidget {
  const HourMarkers({super.key});

  static const double markerPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(markerPadding),
      child: Stack(
        children: List.generate(12, (index) => index + 1)
            .map((hour) => HourMarker(hour: hour))
            .toList(),
      ),
    );
  }
}

class HourMarker extends StatelessWidget {
  const HourMarker({required this.hour, super.key});

  final int hour;
  final double markerHeight = 16;
  final double markerPadding = 6;
  final double markerWidth = 4;
  final double clockSize = Constant.clockSize - (HourMarkers.markerPadding * 2);

  final Map<int, Alignment> _preDefinedMarkers = const {
    12: Alignment.topCenter,
    3: Alignment.centerRight,
    6: Alignment.bottomCenter,
    9: Alignment.centerLeft,
  };

  @override
  Widget build(BuildContext context) {
    return _preDefinedMarkers.containsKey(hour)
        ? _buildPreDefinedMarker(hour, _preDefinedMarkers[hour]!)
        : _buildMarkerLine(hour);
  }

  Widget _buildMarkerLine(int hour) {
    return Center(
      child: Transform.rotate(
        angle: (hour % 12) * 2 * 3.14159 / 12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: markerPadding),
            _buildMarker(),
            SizedBox(
              height: clockSize - (2 * markerHeight) - (2 * markerPadding),
            ),
            _buildMarker(),
            Container(height: markerPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildMarker() {
    return Container(
      width: markerWidth,
      height: markerHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Widget _buildPreDefinedMarker(int hour, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(
          left: hour == 9 ? 4 : 0,
          right: hour == 3 ? 4 : 0,
        ),
        child: Text(
          hour.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
