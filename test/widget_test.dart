import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/app.dart';

void main() {
  testWidgets('stopwatch cycle', (WidgetTester tester) async {

    await tester.pumpWidget(const App());

    await tester.pump(const Duration(microseconds: 100));

    expect(find.text("Start"), findsOneWidget);

    await tester.tap(find.text('Start'));

    await tester.pump(const Duration(microseconds: 100));

    expect(find.text("Stop"), findsOneWidget);

    expect(find.text('Lap 0'), findsOneWidget);

    await tester.tap(find.text('Lap 0'));

    await tester.pump(const Duration(microseconds: 100));

    await tester.tap(find.text('Lap 1'));

    await tester.pump(const Duration(microseconds: 100));

    expect(find.text('Lap 2'), findsOneWidget);

    await tester.tap(find.text('Reset'));

    await tester.pump(const Duration(microseconds: 100));

    expect(find.text("Start"), findsOneWidget);

    expect(find.text('Lap 0'), findsOneWidget);
  });
}
