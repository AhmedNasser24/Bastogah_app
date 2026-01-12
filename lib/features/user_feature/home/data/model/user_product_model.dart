class UserProductModel {
  final String? id;
  final List<String>? images;
  final String? name;
  final String? desc;
  final bool? userProductModelNew;
  final bool? popular;
  final int? price;
  final int? discountAmount;
  final int? offerDiscount;
  final int? finalPrice;
  final Merchant? merchant;
  final String? category;
  final bool? active;
  final bool? deleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final dynamic discount;
  final int? adminDiscountAmount;
  final int? merchantDiscountAmount;
  final dynamic offer;

  UserProductModel({
    this.id,
    this.images,
    this.name,
    this.desc,
    this.userProductModelNew,
    this.popular,
    this.price,
    this.discountAmount,
    this.offerDiscount,
    this.finalPrice,
    this.merchant,
    this.category,
    this.active,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.adminDiscountAmount,
    this.merchantDiscountAmount,
    this.offer,
  });

  factory UserProductModel.fromJson(Map<String, dynamic> json) =>
      UserProductModel(
        id: json["_id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        name: json["name"],
        desc: json["desc"],
        userProductModelNew: json["new"],
        popular: json["popular"],
        price: json["price"],
        discountAmount: json["discountAmount"],
        offerDiscount: json["offerDiscount"],
        finalPrice: json["finalPrice"],
        merchant: json["merchant"] == null
            ? null
            : Merchant.fromJson(json["merchant"]),
        category: json["category"],
        active: json["active"],
        deleted: json["deleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        discount: json["discount"],
        adminDiscountAmount: json["adminDiscountAmount"],
        merchantDiscountAmount: json["merchantDiscountAmount"],
        offer: json["offer"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "name": name,
    "desc": desc,
    "new": userProductModelNew,
    "popular": popular,
    "price": price,
    "discountAmount": discountAmount,
    "offerDiscount": offerDiscount,
    "finalPrice": finalPrice,
    "merchant": merchant?.toJson(),
    "category": category,
    "active": active,
    "deleted": deleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "discount": discount,
    "adminDiscountAmount": adminDiscountAmount,
    "merchantDiscountAmount": merchantDiscountAmount,
    "offer": offer,
  };

  static List<UserProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => UserProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

class Merchant {
  final String? id;
  final String? displayName;
  final String? image;
  final List<String>? coverImages;
  final String? about;
  final String? openTime;
  final String? closeTime;
  final int? maxDiscount;
  final dynamic discount;

  Merchant({
    this.id,
    this.displayName,
    this.image,
    this.coverImages,
    this.about,
    this.openTime,
    this.closeTime,
    this.maxDiscount,
    this.discount,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    id: json["_id"],
    displayName: json["displayName"],
    image: json["image"],
    coverImages: json["coverImages"] == null
        ? []
        : List<String>.from(json["coverImages"]!.map((x) => x)),
    about: json["about"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    maxDiscount: json["maxDiscount"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "displayName": displayName,
    "image": image,
    "coverImages": coverImages == null
        ? []
        : List<dynamic>.from(coverImages!.map((x) => x)),
    "about": about,
    "openTime": openTime,
    "closeTime": closeTime,
    "maxDiscount": maxDiscount,
    "discount": discount,
  };
}
