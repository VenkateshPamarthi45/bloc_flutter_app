import 'package:bloc/bloc.dart';
import 'package:bloc_sample_1/features/weather/data/models/weather.dart';
import 'package:bloc_sample_1/features/weather/domain/usecases/weather_usecase.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase _usecase;

  WeatherBloc(this._usecase) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is SearchClicked) {
        var weather = await _usecase.getWeatherDetails(event.cityName);
        emit(WeatherLoaded(weather));
      }
    });
  }
}
