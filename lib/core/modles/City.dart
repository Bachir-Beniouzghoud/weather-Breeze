import 'package:newproject/core/modles/coord.dart';

class City {
  int? id;
  String? name;
  Coord? coord;

  City({this.id, this.name, this.coord});

  factory City.fromJson(Map<String, dynamic>? json) {
    if (json == null) return City();

    return City(
      id: json['id'] as int?,
      name: json['name'] as String?,
      coord: json['coord'] != null
          ? Coord.fromjeson(json['coord'] as Map<String, dynamic>)
          : null,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'coord': coord?.toJson(),
  //   };
  // }
}
