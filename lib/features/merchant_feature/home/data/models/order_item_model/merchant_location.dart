import 'package:collection/collection.dart';

class MerchantLocation {
  String? type;
  List<double>? coordinates;

  MerchantLocation({this.type, this.coordinates});

  factory MerchantLocation.fromJson(Map<String, dynamic> json) {
    return MerchantLocation(
      type: json['type'] as String?,
      coordinates: json['coordinates'] as List<double>?,
    );
  }

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MerchantLocation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode;
}
