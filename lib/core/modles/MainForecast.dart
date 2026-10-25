import 'package:newproject/core/modles/main_weather.dart';

class MainForecast {
  double? tempKf; // معامل تصحيح درجة الحرارة Internal Parameter
  double? dewPoint; // نقطة الندى (Dew Point)
  MainWeather? mainWeather;
  MainForecast({this.dewPoint, this.mainWeather, this.tempKf});
  factory MainForecast.fromJson(dynamic json) {
    if (json == null) {
      return MainForecast();
    } else {
      return MainForecast(
        dewPoint: (json['dew_point'] as num).toDouble(),
        tempKf: (json['temp_kf'] as num).toDouble(),
        mainWeather: MainWeather.fromson(json),
      );
    }
  }
}
