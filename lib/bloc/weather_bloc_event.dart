part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocEvent extends Equatable{
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent{

}