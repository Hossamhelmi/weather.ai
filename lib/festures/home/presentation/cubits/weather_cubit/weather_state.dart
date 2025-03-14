part of 'weather_cubit.dart';

class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}
final class IndexChanged extends WeatherState {
}

final class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
