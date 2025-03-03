import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ai/festures/home/domain/entity/weather.dart';
import 'package:weather_ai/festures/home/domain/use_case/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUsecase getWeatherUsecase;
  int calenderIndex = 0;
  late Weather myWeather;
  WeatherCubit(this.getWeatherUsecase) : super(WeatherInitial());

  Future<void> getWeather(double lat, double lng) async {
    emit(WeatherLoading());

    final result = await getWeatherUsecase(lat, lng);
    result.fold(
      (error) => emit(WeatherError(error.toString())),
      (weather) {
        myWeather = weather;
        emit(WeatherLoaded(weather));
      },
    );
  }
 

  void changeSelectedDay(int index) {
    calenderIndex = index;
    emit(IndexChanged());
  }
}
