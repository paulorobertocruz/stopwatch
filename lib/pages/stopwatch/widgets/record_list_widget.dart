import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'record_widget.dart';

class RecordListWidget extends StatelessWidget {
  const RecordListWidget({
    super.key,
    required this.records,
  });

  final Stream<List<StopWatchRecord>> records;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: records,
      builder: (context, snap) {
        final records = snap.data ?? [];
        return SingleChildScrollView(
          child: Column(
            children: [
              for (var index = 0; index < records.length; index++)
                RecordWidget(
                  index: index,
                  time: records[index].rawValue ?? 0,
                ),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        );
      },
    );
  }
}
