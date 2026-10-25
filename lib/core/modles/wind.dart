class Wind {
  final double? speed, gust;
  final int? deg;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(dynamic json) {
    if (json == null) {
      return Wind();
    }
    return Wind(
      speed: (json['speed'] as num).toDouble(),
      gust: (json['gust'] as num).toDouble(),
      deg: (json['deg'] as num).toInt(),
    );
  }
}
