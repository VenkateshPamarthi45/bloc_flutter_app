import 'package:bloc_sample_1/features/weather/data/datasources/fake_datasource.dart';
import 'package:bloc_sample_1/features/weather/data/models/weather.dart';

abstract class WeatherRepo {
  Future<Weather> getWeatherDetails(String cityName);
}

class FakeWeatherRepo extends WeatherRepo {
  final FakeDataSource _dataSource;
  FakeWeatherRepo(this._dataSource);

  @override
  Future<Weather> getWeatherDetails(String cityName) async {
    return await _dataSource.loadDataFromDisk(cityName);
  }
}
