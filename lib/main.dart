import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'StopWatch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StopWatchTimer timer = StopWatchTimer();

  String get playTitle {
    if (timer.isRunning) return "Stop";
    return "Start";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: timer.rawTime,
                builder: (context, snapshot) {
                  return Text(
                    StopWatchTimer.getDisplayTime(snapshot.data ?? 0),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    timer.onAddLap();
                  },
                  child: const Text("add lap"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (timer.isRunning) {
                        timer.onStopTimer();
                      } else {
                        timer.onStartTimer();
                      }
                    });
                  },
                  child: Text(playTitle),
                ),
                ElevatedButton(
                  onPressed: () {
                    timer.onResetTimer();
                  },
                  child: Text("reset"),
                ),
              ],
            ),
            StreamBuilder(stream: timer.records, builder: (context, snapshot){
              final records = snapshot.data ?? [];

              return Column(children: records.map((e) => Text(StopWatchTimer.getDisplayTime(e.rawValue ?? 0))).toList(),);
            }),
          ],
        ),
      ),
    );
  }
}
