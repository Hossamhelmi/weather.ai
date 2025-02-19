import 'package:weather_ai/festures/home/data/models/current.dart';
import 'package:weather_ai/festures/home/data/models/forcast_model.dart';
import 'package:weather_ai/festures/home/data/models/location_model.dart';

class WeatherModel {
  LocationModel? location;
  CurrentModel? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = LocationModel.fromJson(json['location']);
    current = CurrentModel.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }
}
