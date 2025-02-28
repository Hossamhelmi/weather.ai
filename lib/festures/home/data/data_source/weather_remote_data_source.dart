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

  Future getPrediction(List<int> features) async {
    // Create the POST request body
    Map<String, dynamic> body = {'features': features};

    // Send the POST request
    final response = await _dio.post(
      'http://192.168.1.15:5001/predict',
      data: body,
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Handle the response
    if (response.statusCode == 200) {
      final prediction = response.data['prediction'];
      return prediction;
    }
    else {
      throw Exception('Failed to get prediction');
    }
  }
}
