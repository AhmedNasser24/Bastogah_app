class UserMerchantModel {
  String? id;
  String? name;
  String? image;
  UserMerchantModel({this.id, this.name, this.image});

  factory UserMerchantModel.fromJson(Map<String, dynamic> json) =>
      UserMerchantModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  static List<UserMerchantModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => UserMerchantModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
