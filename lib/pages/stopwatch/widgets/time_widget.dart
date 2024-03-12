import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.rawTime,
  });

  final Stream<int> rawTime;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: rawTime,
        builder: (context, snapshot) {
          return Text(
            StopWatchTimer.getDisplayTime(snapshot.data ?? 0),
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          );
        });
  }
}
