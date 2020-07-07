import 'package:meta/meta.dart';
import 'package:flutter_bloc_learning_app/weather_app/src/models/models.dart';
import 'package:flutter_bloc_learning_app/weather_app/src/repositories/repositories.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
