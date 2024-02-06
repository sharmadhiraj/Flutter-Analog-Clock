import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/components/clock.dart';
import 'package:flutter_analog_clock/util/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(Constant.appName),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildBorder(),
        const ClockWidget(),
        _buildCenter(),
      ],
    );
  }

  Widget _buildBorder() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        width: Constant.clockSize,
        height: Constant.clockSize,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 4,
          ),
        ),
      ),
    );
  }

  Widget _buildCenter() {
    return Center(
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
