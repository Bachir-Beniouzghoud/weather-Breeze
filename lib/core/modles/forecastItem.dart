import 'package:flutter/material.dart';
import 'package:newproject/core/modles/MainForecast.dart';
import 'package:newproject/core/modles/clouds.dart';
import 'package:newproject/core/modles/sys.dart';
import 'package:newproject/core/modles/weather.dart';
import 'package:newproject/core/modles/wind.dart';

class forecastItem {
  int? dt, visibility;
  MainForecast? mainForecast;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  num? pop;
  String? dtTxt;
  Sys? sys;
  forecastItem({
    this.clouds,
    this.dt,
    this.dtTxt,
    this.mainForecast,
    this.pop,
    this.sys,
    this.visibility,
    this.weather,
    this.wind,
  });
  factory forecastItem.fromJson(dynamic json) {
    if (json == null) {
      return forecastItem();
    } else {
      // edit the date
      // var f = json['dt_txt'].split(' ')[0].split('-')[2];
      // var l = json['dt_txt'].split(' ')[1].split(':')[0];
      // var fandl = '$f-$l';
      return forecastItem(
        mainForecast: MainForecast.fromJson(json['main']),
        weather: (json['weather'] as List)
            .map((w) => Weather.fromJson(w))
            .toList(),
        clouds: Clouds.fromJson(json['clouds']),
        wind: Wind.fromJson(json['wind']),
        sys: Sys.fromJson(json['sys']),
        dt: json['dt'],
        dtTxt: json['dt_txt'],
        // json['dt_txt'],
        pop: json['pop'],
        visibility: json['visibility'],
      );
    }
  }
}
