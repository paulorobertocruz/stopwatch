
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class RecordAddButtonWidget extends StatelessWidget {
  const RecordAddButtonWidget({
    super.key,
    required this.addLap,
    required this.records,
  });

  final void Function() addLap;
  final Stream<List<StopWatchRecord>> records;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: records,
      builder: (context, snap) {
        final laps = snap.data ?? [];
        return ElevatedButton(
          onPressed: addLap,
          child: Text("Lap ${laps.length}"),
        );
      },
    );
  }
}
