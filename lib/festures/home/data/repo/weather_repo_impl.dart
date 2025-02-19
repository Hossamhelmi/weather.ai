import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:weather_ai/festures/home/data/data_source/weather_remote_data_source.dart';
import 'package:weather_ai/festures/home/domain/entity/weather.dart';
import 'package:weather_ai/festures/home/domain/repo/base_weather_repo.dart';

class WeatherRepoImpl extends BaseWeatherRepo {
  final RemoteDataSourceWeather remoteDataSourceWeather;
  WeatherRepoImpl(this.remoteDataSourceWeather);

  @override
  Future<Either<Exception, Weather>> getWeatherData(
      double lat, double lon) async {
    try {
      final weatherModel = await remoteDataSourceWeather.getWeather(lat, lon);
      
          weatherModel.forecast!.forecastday!.forEach((e) {
        DateTime parsedDate = DateFormat("yyyy-MM-dd").parse(e.date!);
        String formattedDate = DateFormat("EEE, d").format(parsedDate);
        e.date = formattedDate;
      }) ;

      return Right(
        Weather(
          cityName: weatherModel.location!.name!,
          temperature: weatherModel.current!.tempC!,
          cloud: weatherModel.current!.cloud!,
          humidity: weatherModel.current!.humidity!,
          days: weatherModel.forecast!.forecastday!,
        ),
      );
    } catch (e) {
      return Left(
        Exception(e.toString()),
      );
    }
  }
}
