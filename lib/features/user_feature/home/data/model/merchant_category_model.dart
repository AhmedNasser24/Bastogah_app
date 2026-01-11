class MerchantCategoryModel {
  String? id;
  String? name;
  String? image;
  String? coverImage;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  int? v;
  MerchantCategoryModel({
    this.id,
    this.name,
    this.image,
    this.coverImage,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MerchantCategoryModel.fromJson(Map<String, dynamic> json) =>
      MerchantCategoryModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        coverImage: json['coverImage'] as String?,
        deleted: json['deleted'] as bool?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
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
