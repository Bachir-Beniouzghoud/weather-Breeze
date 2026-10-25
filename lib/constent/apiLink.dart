// ignore: camel_case_types
class apiurl {
  // String? path;

  static Map<String, dynamic> getqueryParameters(
    String? city, {
    String? units,
    String? lang,
    int? cnt,
    double? lon,
    double? lat,
  })
  // body mrthode
  {
    units ??= 'metric';
    lang ??= 'en';
    final Map<String, dynamic> query = {
      'q': city,
      'units': units,
      'cnt': cnt,
      'lang': lang,
      'lon': lon,
      'lat': lat,
      'appid': apikey,
    };
    query.removeWhere((key, value) => value == null);
    return query;
  }

  // apiurl({ this.city, this.cnt});
  static final String basurl = "https://api.openweathermap.org/data/2.5/";
  // الوضع الحالي
  static final String currenturl = "weather";
  // توقعات كل سعات 3 أيام
  static final String hourlyForecastDays = "forecast";
  static final String apikey = "032ba4a46c4377adf1e68aad77af07fc";
}
// https://api.openweathermap.org/data/2.5/weather?q=algeria&appid=032ba4a46c4377adf1e68aad77af07fc
