import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/utilities/constants.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(apiKey, language: Language.ENGLISH);

        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true,
        );

        List<Weather> weatherForecast = await wf.fiveDayForecastByLocation(
          position.latitude,
          position.longitude,
        );
        //print('---------weather forecast: $weatherForecast');
        emit(WeatherBlocSuccess(weatherForecast));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}