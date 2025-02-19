import 'package:weather_ai/festures/home/data/models/forcastday_model.dart';

class Forecast {
   List<Forecastday>? forecastday;

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add( Forecastday.fromJson(v));
      });
    
  }

}



