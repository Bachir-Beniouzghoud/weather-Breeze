import 'package:newproject/constent/apiLink.dart';
import 'package:newproject/core/API/responsapi.dart';
import 'package:newproject/core/error/hndleErorr.dart';
import 'package:newproject/core/modles/CurrentForecastData.dart';
import 'package:newproject/core/modles/CurrentWeatherData.dart';

class Weatherservices {
  final Responsapi _apiCline = Responsapi();
  // توقعات الطقس لكل 3 سعات

  Future<dynamic> fetchForecastData(
    double lat,
    double lon, {
    int? cnt,
    String? city,
    String? lang,
  }) async {
    cnt ??= 16;
    Map<String, dynamic> queryParameters = apiurl.getqueryParameters(
      city,
      cnt: cnt,
      lang: lang,
      lat: lat,
      lon: lon,
    );

    final resoult = await _apiCline.getData(
      // forecast
      apiurl.hourlyForecastDays,
      queryParameters: queryParameters,
    );
    if (resoult is ApiFailure) {
      return resoult;
    } else if (resoult is Map<String, dynamic>) {
      return Currentforecastdata.fromJson(resoult);
    } else {
      return ApiFailure(message: 'بيانات غير صالحة من السيرفر');
    }
  }

  // الطقس الحالي

  Future<dynamic> fetchCurrentWther(
    double lat,
    double lon, {
    String? city,
    String? lang,
  }) async {
    Map<String, dynamic> queryParameters = apiurl.getqueryParameters(
      city,
      lang: lang,
      lat: lat,
      lon: lon,
    );
    final resoult = await _apiCline.getData(
      // weather
      apiurl.currenturl,
      queryParameters: queryParameters,
    );
    if (resoult is ApiFailure) {
      return resoult;
    } else if (resoult is Map<String, dynamic>) {
      return CurrentWeatherData.fromJson(resoult);
    } else {
      return ApiFailure(message: 'بيانات غير صالحة من السيرفر');
    }
  }
}
