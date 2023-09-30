import 'package:bloc_sample_1/counter_usecase.dart';
import 'package:bloc_sample_1/features/ScreenB/presentation/pages/screen_b.dart';
import 'package:bloc_sample_1/features/weather/data/datasources/fake_datasource.dart';
import 'package:bloc_sample_1/features/weather/data/repositories/weather_repo.dart';
import 'package:bloc_sample_1/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:bloc_sample_1/navigation/navigation_pages.dart';
import 'package:bloc_sample_1/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/ScreenB/presentation/bloc/screenb_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: NavigateAppRoutes().navigateToMyHomePage("Venky Page"));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.appRoutes});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final AppRoutes appRoutes;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    context.read<WeatherBloc>().add(const SearchClicked("Vijayawada"));
  }

  void _decrementCounter() {
    //context.read<CounterBloc>().add(DecrementCounterEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) {
                return widget.appRoutes.navigateToScreenB("asd");
              })),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              return Center(
                  child: (state is WeatherInitial)
                      ? const CircularProgressIndicator()
                      : Text((state as WeatherLoaded)
                          .weather
                          .weatherValueInCelisus));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key("plus_button"),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
