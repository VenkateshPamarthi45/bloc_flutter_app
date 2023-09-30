import 'package:bloc_sample_1/features/ScreenB/presentation/pages/screen_b.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/ScreenB/presentation/bloc/screenb_bloc.dart';
import '../features/weather/data/datasources/fake_datasource.dart';
import '../features/weather/data/repositories/weather_repo.dart';
import '../features/weather/domain/usecases/weather_usecase.dart';
import '../features/weather/presentation/bloc/weather_bloc.dart';
import '../main.dart';

abstract class AppRoutes {
  navigateToScreenB(String data);
  navigateToMyHomePage(String title);
}

class NavigateAppRoutes extends AppRoutes {
  @override
  navigateToScreenB(String data) {
    return BlocProvider(
      create: (context) => ScreenbBloc(),
      child: ScreenB(
        data: data,
        appRoutes: this,
      ),
    );
  }

  @override
  navigateToMyHomePage(String title) {
    return BlocProvider<WeatherBloc>(
      create: (context) =>
          WeatherBloc(RealWeatherUsecase(FakeWeatherRepo(FakeDataSource()))),
      child: MyHomePage(
        title: 'Flutter Demo Home Page',
        appRoutes: this,
      ),
    );
  }
}
