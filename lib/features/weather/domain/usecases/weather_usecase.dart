import 'package:bloc_sample_1/features/weather/data/repositories/weather_repo.dart';

import '../../data/models/weather.dart';

abstract class WeatherUsecase {
  Future<Weather> getWeatherDetails(String cityName);
}

class RealWeatherUsecase extends WeatherUsecase {
  final WeatherRepo weatherRepo;
  RealWeatherUsecase(this.weatherRepo);

  @override
  Future<Weather> getWeatherDetails(String cityName) {
    return weatherRepo.getWeatherDetails(cityName);
  }
}
