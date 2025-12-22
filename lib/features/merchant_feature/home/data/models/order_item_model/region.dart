import 'package:collection/collection.dart';

class Region {
  String? id;
  String? name;

  Region({this.id, this.name});

  factory Region.fromJson(Map<String, dynamic> json) =>
      Region(id: json['_id'] as String?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'_id': id, 'name': name};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Region) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
