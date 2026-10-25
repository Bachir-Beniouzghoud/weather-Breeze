class Coord {
  double? lon;
  double? lat;
  Coord({this.lat, this.lon});
  factory Coord.fromjeson(dynamic json) {
    if (json == null) return Coord();
    return Coord(lat: json['lat'], lon: json['lon']);
  }
}
