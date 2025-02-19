import 'package:weather_ai/festures/home/data/models/day_model.dart';

class Forecastday {
  String? date;
  Day? day;

  Forecastday({this.date, this.day});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] = Day.fromJson(json['day']) ;
  }
}