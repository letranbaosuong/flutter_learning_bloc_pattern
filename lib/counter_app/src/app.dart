import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/counters/counter_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/my_themes/my_theme_bloc.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/screens/counter_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MyThemeBloc();
      },
      child: BlocBuilder<MyThemeBloc, ThemeData>(
        builder: (BuildContext context, theme) {
          return MaterialApp(
            title: 'Demo Bloc Counter',
            theme: theme,
            home: BlocProvider(
              create: (BuildContext context) {
                return CounterBloc();
              },
              child: CounterPage(),
            ),
          );
        },
      ),
    );
  }
}
