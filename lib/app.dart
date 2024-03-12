import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'pages/stopwatch/stopwatch_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final timer = StopWatchTimer();
    return MaterialApp(
      title: 'StopWatch',
      home: StopWatchPage(
        timer: timer,
      ),
    );
  }
}
