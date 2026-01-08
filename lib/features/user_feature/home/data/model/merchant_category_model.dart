class MerchantCategoryModel {
  String? id;
  String? name;
  String? image;
  MerchantCategoryModel({this.id, this.name, this.image});

  factory MerchantCategoryModel.fromJson(Map<String, dynamic> json) =>
      MerchantCategoryModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  static List<MerchantCategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map(
          (json) =>
              MerchantCategoryModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
