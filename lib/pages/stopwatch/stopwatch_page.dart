import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'widgets/record_add_button_widget.dart';
import 'widgets/record_list_widget.dart';
import 'widgets/start_stop_button_widget.dart';
import 'widgets/time_widget.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({
    super.key,
    required this.timer,
  });

  final StopWatchTimer timer;
  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
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
                  records: widget.timer.records,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double width = min(constraints.maxWidth * 0.5, 300);
                  
                  return Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(width * 0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimeWidget(
                          rawTime: widget.timer.rawTime,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RecordAddButtonWidget(
                              addLap: () {
                                widget.timer.onAddLap();
                              },
                              records: widget.timer.records,
                              isRunning: widget.timer.isRunning,
                            ),
                            StartStopButtonWiget(
                              isRunning: widget.timer.isRunning,
                              onToggle: () {
                                setState(() {
                                  if (widget.timer.isRunning) {
                                    widget.timer.onStopTimer();
                                  } else {
                                    widget.timer.onStartTimer();
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.timer.onResetTimer();
                            });
                          },
                          child: const Text("Reset"),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
