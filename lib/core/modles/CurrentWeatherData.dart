import 'package:intl/intl.dart';
import 'package:newproject/core/modles/clouds.dart';
import 'package:newproject/core/modles/coord.dart';
import 'package:newproject/core/modles/main_weather.dart';
import 'package:newproject/core/modles/sys.dart';
import 'package:newproject/core/modles/weather.dart';
import 'package:newproject/core/modles/wind.dart';

class CurrentWeatherData {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  MainWeather? mainWeather;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  CurrentWeatherData({
    this.coord,
    this.weather,
    this.base,
    this.mainWeather,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });
 
  factory CurrentWeatherData.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherData();
    }

    return CurrentWeatherData(
      coord: Coord.fromjeson(json['coord']),
      weather: (json['weather'] as List)
          .map((w) => Weather.fromJson(w))
          .toList(),
      base: json['base'],
      mainWeather: MainWeather.fromson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
