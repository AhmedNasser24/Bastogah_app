import 'package:collection/collection.dart';

import 'city.dart';
import 'region.dart';

class Client {
  String? id;
  Region? region;
  City? city;

  Client({this.id, this.region, this.city});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json['_id'] as String?,
    region: json['region'] == null
        ? null
        : Region.fromJson(json['region'] as Map<String, dynamic>),
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'region': region?.toJson(),
    'city': city?.toJson(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Client) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ region.hashCode ^ city.hashCode;
}
