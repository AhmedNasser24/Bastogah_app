class UserProductModel {
  String? id;
  String? name;
  String? image;
  UserProductModel({this.id, this.name, this.image});

  factory UserProductModel.fromJson(Map<String, dynamic> json) =>
      UserProductModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  static List<UserProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => UserProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
