import 'package:flutter/material.dart';
import 'package:flutter_bloc_learning_app/weather_app/src/models/models.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  const WeatherConditions({Key key, @required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/weather_app/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/weather_app/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/weather_app/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/weather_app/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/weather_app/thunderstorm.png');
        break;
      case WeatherCondition.unknow:
        image = Image.asset('assets/weather_app/clear.png');
        break;
    }

    return image;
  }
}
