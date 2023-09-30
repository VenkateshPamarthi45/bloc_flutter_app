part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class SearchClicked extends WeatherEvent {
  final String cityName;
  const SearchClicked(this.cityName);
}
