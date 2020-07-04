import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning_app/timer_app/src/bloc/timer_bloc.dart';
import 'package:flutter_bloc_learning_app/timer_app/src/bloc/timer_state.dart';
import 'package:flutter_bloc_learning_app/timer_app/src/components/timer_page/background.dart';
import 'package:flutter_bloc_learning_app/timer_app/src/components/timer_page/my_actions.dart';

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Timer'),
      ),
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      final String minutesStr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final String secondStr = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');

                      return Text(
                        '$minutesStr:$secondStr',
                        style: Timer.timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                condition: (previousState, currentState) =>
                    currentState.runtimeType != previousState.runtimeType,
                builder: (context, state) => MyActions(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
