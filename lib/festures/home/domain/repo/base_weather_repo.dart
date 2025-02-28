import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/home/domain/entity/weather.dart';

abstract class BaseWeatherRepo {
  Future<Either<Exception,Weather>> getWeatherData(double lat, double lon);
  Future<Either<Exception,dynamic>> getPrediction(List<int> features);

}