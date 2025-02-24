import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/home/domain/entity/weather.dart';
import 'package:weather_ai/festures/home/domain/repo/base_weather_repo.dart';

class GetWeatherUsecase {
  final BaseWeatherRepo repository;

  GetWeatherUsecase(this.repository);

  Future<Either<Exception, Weather>> call(double lat, double lon) async {
    return await repository.getWeatherData(lat, lon);
  }
}
