class Weather {
  final String cityName;
  final String weatherValueInCelisus;
  final String weatherValueInFr;

  Weather(this.weatherValueInFr,
      {required this.cityName, required this.weatherValueInCelisus});
}
