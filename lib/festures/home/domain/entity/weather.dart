import 'package:weather_ai/festures/home/data/models/forcastday_model.dart';

class Weather {
  final String cityName;
  final double temperature;
  final int cloud;
  final int humidity;
  final List<Forecastday> days;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.cloud,
    required this.humidity,
    required this.days,
  });

  List<int> getAiList() {
    List<int> aiList = [];
    
    if (cloud > 23) {
      aiList.add(1);
      aiList.add(0);
    } else {
      aiList.add(0);
      aiList.add(1);
    }
    if (temperature > 30) {
      aiList.add(1);
      aiList.add(0);
    } else {
      aiList.add(0);
      aiList.add(1);
    }
    if (humidity > 30 && humidity < 50) {
      aiList.add(1);
    } else {
      aiList.add(0);
    }

    return aiList;
  }
}
