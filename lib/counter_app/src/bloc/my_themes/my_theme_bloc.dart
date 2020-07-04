import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learning_app/counter_app/src/bloc/my_themes/my_theme_event.dart';

class MyThemeBloc extends Bloc<MyThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(MyThemeEvent event) async* {
    switch (event) {
      case MyThemeEvent.toggle:
        yield state == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
        break;
      default:
        break;
    }
  }
}
