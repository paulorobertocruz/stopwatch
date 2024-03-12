
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({
    super.key,
    required this.index,
    required this.time,
  });

  final int index;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Text("${index + 1} - ${StopWatchTimer.getDisplayTime(time)}");
  }
}
