import 'package:bloc_sample_1/features/weather/data/models/weather.dart';

class FakeDataSource {
  Future<Weather> loadDataFromDisk(String cityName) {
    return Future.delayed(const Duration(seconds: 1), () {
      return Weather("89", cityName: "Vijayawada", weatherValueInCelisus: "44");
    });
  }
}
