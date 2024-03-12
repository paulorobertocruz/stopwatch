import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'widgets/record_add_button_widget.dart';
import 'widgets/record_list_widget.dart';
import 'widgets/start_stop_button_widget.dart';
import 'widgets/time_widget.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({
    super.key,
  });

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  StopWatchTimer timer = StopWatchTimer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: RecordListWidget(
                  records: timer.records,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeWidget(
                        rawTime: timer.rawTime,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RecordAddButtonWidget(
                            addLap: () {
                              timer.onAddLap();
                            },
                            records: timer.records,
                            isRunning: timer.isRunning,
                          ),
                          StartStopButtonWiget(
                            isRunning: timer.isRunning,
                            onToggle: () {
                              setState(() {
                                if (timer.isRunning) {
                                  timer.onStopTimer();
                                } else {
                                  timer.onStartTimer();
                                }
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                timer.onResetTimer();
                              });
                            },
                            child: const Text("Reset"),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
