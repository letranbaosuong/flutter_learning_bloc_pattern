import 'package:flutter_bloc_learning_app/counter_app/src/bloc/counters/counter_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('CounterBloc', () {
    CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.initialState, 0);
      counterBloc.close();
    });
  });
}
