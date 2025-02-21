// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_bloc_learning_app/counter_app/src/bloc/counters/counter_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/counters/counter_event.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(App());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  group('CounterBloc', () {
    // ignore: close_sinks
    CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.initialState, 0);
    });

    blocTest(
      'emit [1] when CounterEvent.increment is added',
      build: () async => counterBloc,
      act: (bloc) async => bloc.add(CounterEvent.increment),
      expect: [1],
    );

    blocTest(
      'emit [-1] when CounterEvent.decrement is added',
      build: () async => counterBloc,
      act: (bloc) async => bloc.add(CounterEvent.decrement),
      expect: [-1],
    );
  });
}
