import 'package:flutter/material.dart';

class StartStopButtonWiget extends StatelessWidget {
  const StartStopButtonWiget({
    super.key,
    required this.isRunning,
    required this.onToggle,
  });

  final bool isRunning;
  final void Function() onToggle;

  String get text => isRunning ? "Stop" : "Start";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onToggle,
      child: Text(text),
    );
  }
}
