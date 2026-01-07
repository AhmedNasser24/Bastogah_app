class CityModel {
  final String name, id;
  const CityModel({required this.name, required this.id});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(name: json['name'], id: json['_id']);
  }

  static List<CityModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CityModel.fromJson(json)).toList();
  }
}
