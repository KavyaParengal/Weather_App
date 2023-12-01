import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Routes/route_name.dart';
import 'Routes/route_navigate.dart';
import 'bloc/weather_bloc_bloc.dart';

void main() {
  runApp(
      BlocProvider<WeatherBlocBloc>(
        create: (context) => WeatherBlocBloc()..add(FetchWeather()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteName.splashScreen,
            onGenerateRoute: RouteNavigation.generateRoute,
            theme: ThemeData(fontFamily: 'HedvigLettersSerif',)
        ),
      ));
}