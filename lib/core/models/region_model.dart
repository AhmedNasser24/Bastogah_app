class RegionModel {
  final String name, id;
  const RegionModel({required this.name, required this.id});

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(name: json['name'], id: json['_id']);
  }

  static List<RegionModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RegionModel.fromJson(json)).toList();
  }
}
