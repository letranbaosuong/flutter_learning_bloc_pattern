import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/counters/counter_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/counters/counter_event.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/my_themes/my_theme_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/my_themes/my_theme_event.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conuter Page'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 40),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.bloc<CounterBloc>().add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.bloc<CounterBloc>().add(CounterEvent.decrement);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: FloatingActionButton(
              child: Icon(Icons.brightness_6),
              onPressed: () {
                context.bloc<MyThemeBloc>().add(MyThemeEvent.toggle);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.error),
              onPressed: () => context.bloc<CounterBloc>().add(null),
            ),
          ),
        ],
      ),
    );
  }
}
