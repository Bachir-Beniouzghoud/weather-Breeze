class MainWeather {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity, grndlevel, sealevel;
  MainWeather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.grndlevel,
    this.sealevel,
  });
  factory MainWeather.fromson(dynamic json) {
    if (json == null) return MainWeather();
    return MainWeather(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
      grndlevel: (json['grnd_level'] as num).toInt(),
      sealevel: (json['sea_level'] as num).toInt(),
    );
  }
}
