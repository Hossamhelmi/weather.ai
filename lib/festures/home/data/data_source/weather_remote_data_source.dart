import 'package:dio/dio.dart';
import 'package:weather_ai/core/utilites/constants.dart';
import 'package:weather_ai/festures/home/data/models/weather_model.dart';

class RemoteDataSourceWeather {
  final Dio _dio = Dio();
  Future<WeatherModel> getWeather(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '$forcastApiUrl?q=$lat,$lon&days=5&tp=24$apiKey',
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
