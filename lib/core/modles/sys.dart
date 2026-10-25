
class Sys {
  final String? country,pod;
  final int? sunrise;
  final int? sunset;

  Sys({this.country, this.sunrise, this.pod, this.sunset});

  factory Sys.fromJson(dynamic json) {
    if (json == null) {
      return Sys();
    }

    return Sys(
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
