import 'package:collection/collection.dart';

class City {
  String? id;
  String? name;

  City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) =>
      City(id: json['_id'] as String?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'_id': id, 'name': name};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! City) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
