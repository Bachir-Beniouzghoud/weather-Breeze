import 'package:newproject/core/modles/forecastItem.dart';

// Modle get data forecast day weather
class Currentforecastdata {
  int? cnt, population, sunset, sunrise, timezone;
  String? country;
  dynamic message, cod;
  List<forecastItem>? list;
  Currentforecastdata({
    this.cnt,
    this.cod,
    this.country,
    this.list,
    this.message,
    this.population,
    this.sunrise,
    this.sunset,
    this.timezone,
  });
  factory Currentforecastdata.fromJson(dynamic json) {
    if (json == null) {
      return Currentforecastdata();
    } else {
      return Currentforecastdata(
        cod: json['cod'],
        message: json['message'],
        cnt: json['cnt'],
        list: json['list'] != null
            ? (json['list'] as List)
                  .map((toElement) => forecastItem.fromJson(toElement))
                  .toList()
            : null,
      );
    }
  }
}
