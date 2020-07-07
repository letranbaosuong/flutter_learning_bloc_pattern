import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_learning_app/weather_app/src/models/models.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class WeatherChanged extends ThemeEvent {
  final WeatherCondition condition;

  const WeatherChanged({@required this.condition}) : assert(condition != null);

  @override
  List<Object> get props => [condition];
}
