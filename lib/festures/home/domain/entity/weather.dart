import 'package:weather_ai/festures/home/data/models/forcastday_model.dart';

class Weather {
  final String cityName;
  final double temperature;
  final int cloud;
  final int humidity;
  final List<Forecastday> days;



  Weather( {
    required this.cityName,
    required this.temperature,
    required this.cloud,
    required this.humidity,
    required this.days,
  });
  
}