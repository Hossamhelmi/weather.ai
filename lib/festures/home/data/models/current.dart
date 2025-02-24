class CurrentModel {
  String? lastUpdated;
  double? tempC;
  int? isDay;
  String? condition;
  double? windKph;
  double? pressureMb;
  double? pressureIn;
  int? humidity;
  int? cloud;

  CurrentModel(
      {this.lastUpdated,
      this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.pressureMb,
      this.pressureIn,
      this.humidity,
      this.cloud});

  CurrentModel.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition']['text'];
    windKph = json['wind_kph'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
  }
}
