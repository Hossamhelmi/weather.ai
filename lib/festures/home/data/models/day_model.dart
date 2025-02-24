class Day {
  double? avgtempC;
  double? maxwindKph;
  int? avghumidity;

  Day({this.avgtempC, this.maxwindKph, this.avghumidity});

  Day.fromJson(Map<String, dynamic> json) {
    avgtempC = json['avgtemp_c'];
    maxwindKph = json['maxwind_kph'];
    avghumidity = json['avghumidity'];
  }
}
