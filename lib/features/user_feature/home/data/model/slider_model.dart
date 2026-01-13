class SliderModel {
  final String? id;
  final String? image;
  final String? videoLink;
  final String? name;
  final MerchantCategory? merchantCategory;
  final bool? deleted;
  final bool? isDiscount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Merchant? merchant;
  final Product? product;

  SliderModel({
    this.id,
    this.image,
    this.videoLink,
    this.name,
    this.merchantCategory,
    this.deleted,
    this.isDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.merchant,
    this.product,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    id: json["_id"],
    image: json["image"],
    videoLink: json["videoLink"],
    name: json["name"],
    merchantCategory: json["merchantCategory"] == null
        ? null
        : MerchantCategory.fromJson(json["merchantCategory"]),
    deleted: json["deleted"],
    isDiscount: json["isDiscount"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    merchant: json["merchant"] == null
        ? null
        : Merchant.fromJson(json["merchant"]),
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "videoLink": videoLink,
    "name": name,
    "merchantCategory": merchantCategory?.toJson(),
    "deleted": deleted,
    "isDiscount": isDiscount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "merchant": merchant?.toJson(),
    "product": product?.toJson(),
  };
  static List<SliderModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SliderModel.fromJson(json)).toList();
  }
}

class Merchant {
  final dynamic lastPaidSalaryType;
  final String? id;
  final String? displayName;
  final String? image;
  final String? username;
  final List<String>? roles;
  final bool? active;
  final String? phone;
  final List<String>? coverImages;
  final int? commissionPercent;
  final dynamic commissionAmount;
  final String? category;
  final String? subCategory;
  final String? about;
  final int? totalOrders;
  final int? balance;
  final int? transactionsBalance;
  final int? ratingCount;
  final int? ratingAvg;
  final int? merchantShippingPrice;
  final bool? popular;
  final MerchantLocation? merchantLocation;
  final DateTime? lastCheckOut;
  final String? openTime;
  final String? closeTime;
  final int? sort;
  final int? maxDiscount;
  final int? driverShippingPrice;
  final bool? online;
  final DateTime? lastSeen;
  final int? driverSalaryType;
  final dynamic previousType;
  final int? driverOrderPercent;
  final dynamic lastPaidSalaryDate;
  final dynamic region;
  final dynamic city;
  final dynamic discount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Merchant({
    this.lastPaidSalaryType,
    this.id,
    this.displayName,
    this.image,
    this.username,
    this.roles,
    this.active,
    this.phone,
    this.coverImages,
    this.commissionPercent,
    this.commissionAmount,
    this.category,
    this.subCategory,
    this.about,
    this.totalOrders,
    this.balance,
    this.transactionsBalance,
    this.ratingCount,
    this.ratingAvg,
    this.merchantShippingPrice,
    this.popular,
    this.merchantLocation,
    this.lastCheckOut,
    this.openTime,
    this.closeTime,
    this.sort,
    this.maxDiscount,
    this.driverShippingPrice,
    this.online,
    this.lastSeen,
    this.driverSalaryType,
    this.previousType,
    this.driverOrderPercent,
    this.lastPaidSalaryDate,
    this.region,
    this.city,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    lastPaidSalaryType: json["lastPaidSalaryType"],
    id: json["_id"],
    displayName: json["displayName"],
    image: json["image"],
    username: json["username"],
    roles: json["roles"] == null
        ? []
        : List<String>.from(json["roles"]!.map((x) => x)),
    active: json["active"],
    phone: json["phone"],
    coverImages: json["coverImages"] == null
        ? []
        : List<String>.from(json["coverImages"]!.map((x) => x)),
    commissionPercent: json["commissionPercent"],
    commissionAmount: json["commissionAmount"],
    category: json["category"],
    subCategory: json["subCategory"],
    about: json["about"],
    totalOrders: json["totalOrders"],
    balance: json["balance"],
    transactionsBalance: json["transactionsBalance"],
    ratingCount: json["ratingCount"],
    ratingAvg: json["ratingAvg"],
    merchantShippingPrice: json["merchantShippingPrice"],
    popular: json["popular"],
    merchantLocation: json["merchantLocation"] == null
        ? null
        : MerchantLocation.fromJson(json["merchantLocation"]),
    lastCheckOut: json["lastCheckOut"] == null
        ? null
        : DateTime.parse(json["lastCheckOut"]),
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    sort: json["sort"],
    maxDiscount: json["maxDiscount"],
    driverShippingPrice: json["driverShippingPrice"],
    online: json["online"],
    lastSeen: json["lastSeen"] == null
        ? null
        : DateTime.parse(json["lastSeen"]),
    driverSalaryType: json["driverSalaryType"],
    previousType: json["previousType"],
    driverOrderPercent: json["driverOrderPercent"],
    lastPaidSalaryDate: json["lastPaidSalaryDate"],
    region: json["region"],
    city: json["city"],
    discount: json["discount"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "lastPaidSalaryType": lastPaidSalaryType,
    "_id": id,
    "displayName": displayName,
    "image": image,
    "username": username,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "active": active,
    "phone": phone,
    "coverImages": coverImages == null
        ? []
        : List<dynamic>.from(coverImages!.map((x) => x)),
    "commissionPercent": commissionPercent,
    "commissionAmount": commissionAmount,
    "category": category,
    "subCategory": subCategory,
    "about": about,
    "totalOrders": totalOrders,
    "balance": balance,
    "transactionsBalance": transactionsBalance,
    "ratingCount": ratingCount,
    "ratingAvg": ratingAvg,
    "merchantShippingPrice": merchantShippingPrice,
    "popular": popular,
    "merchantLocation": merchantLocation?.toJson(),
    "lastCheckOut": lastCheckOut?.toIso8601String(),
    "openTime": openTime,
    "closeTime": closeTime,
    "sort": sort,
    "maxDiscount": maxDiscount,
    "driverShippingPrice": driverShippingPrice,
    "online": online,
    "lastSeen": lastSeen?.toIso8601String(),
    "driverSalaryType": driverSalaryType,
    "previousType": previousType,
    "driverOrderPercent": driverOrderPercent,
    "lastPaidSalaryDate": lastPaidSalaryDate,
    "region": region,
    "city": city,
    "discount": discount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class MerchantLocation {
  final String? type;
  final List<double>? coordinates;

  MerchantLocation({this.type, this.coordinates});

  factory MerchantLocation.fromJson(Map<String, dynamic> json) =>
      MerchantLocation(
        type: json["type"],
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null
        ? []
        : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class MerchantCategory {
  final String? id;
  final String? image;
  final String? coverImage;
  final String? name;
  final bool? deleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MerchantCategory({
    this.id,
    this.image,
    this.coverImage,
    this.name,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MerchantCategory.fromJson(Map<String, dynamic> json) =>
      MerchantCategory(
        id: json["_id"],
        image: json["image"],
        coverImage: json["coverImage"],
        name: json["name"],
        deleted: json["deleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "coverImage": coverImage,
    "name": name,
    "deleted": deleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Product {
  final String? id;
  final List<String>? images;
  final String? name;
  final String? desc;
  final bool? productNew;
  final bool? popular;
  final int? price;
  final int? discountAmount;
  final int? adminDiscountAmount;
  final int? merchantDiscountAmount;
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

  Product({
    this.id,
    this.images,
    this.name,
    this.desc,
    this.productNew,
    this.popular,
    this.price,
    this.discountAmount,
    this.adminDiscountAmount,
    this.merchantDiscountAmount,
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
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    images: json["images"] == null
        ? []
        : List<String>.from(json["images"]!.map((x) => x)),
    name: json["name"],
    desc: json["desc"],
    productNew: json["new"],
    popular: json["popular"],
    price: json["price"],
    discountAmount: json["discountAmount"],
    adminDiscountAmount: json["adminDiscountAmount"],
    merchantDiscountAmount: json["merchantDiscountAmount"],
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
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "name": name,
    "desc": desc,
    "new": productNew,
    "popular": popular,
    "price": price,
    "discountAmount": discountAmount,
    "adminDiscountAmount": adminDiscountAmount,
    "merchantDiscountAmount": merchantDiscountAmount,
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
  };
}
