class ProfileModel {
  String? id;
  String? displayName;
  String? image;
  String? username;
  List<String>? roles;
  final bool active;
  String? phone;
  List<dynamic>? coverImages;
  int? commissionPercent;
  int? commissionAmount;
  String? about;
  int? totalOrders;
  int? balance;
  int? transactionsBalance;
  int? ratingCount;
  int? ratingAvg;
  int? merchantShippingPrice;
  bool? popular;
  dynamic lastCheckOut;
  String? openTime;
  String? closeTime;
  int? sort;
  int? maxDiscount;
  int? driverShippingPrice;
  bool? online;
  DateTime? lastSeen;
  int? driverSalaryType;
  dynamic previousType;
  int? driverOrderPercent;
  dynamic lastPaidSalaryDate;
  dynamic lastPaidSalaryType;
  Region? region;
  City? city;
  dynamic discount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProfileModel({
    this.id,
    this.displayName,
    this.image,
    this.username,
    this.roles,
    required this.active,
    this.phone,
    this.coverImages,
    this.commissionPercent,
    this.commissionAmount,
    this.about,
    this.totalOrders,
    this.balance,
    this.transactionsBalance,
    this.ratingCount,
    this.ratingAvg,
    this.merchantShippingPrice,
    this.popular,
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
    this.lastPaidSalaryType,
    this.region,
    this.city,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["_id"],
    displayName: json["displayName"],
    image: json["image"],
    username: json["username"],
    roles: json["roles"] == null
        ? null
        : List<String>.from(json["roles"].map((x) => x)),
    active: json["active"],
    phone: json["phone"],
    coverImages: json["coverImages"] == null
        ? null
        : List<dynamic>.from(json["coverImages"].map((x) => x)),
    commissionPercent: json["commissionPercent"],
    commissionAmount: json["commissionAmount"],
    about: json["about"],
    totalOrders: json["totalOrders"],
    balance: json["balance"],
    transactionsBalance: json["transactionsBalance"],
    ratingCount: json["ratingCount"],
    ratingAvg: json["ratingAvg"],
    merchantShippingPrice: json["merchantShippingPrice"],
    popular: json["popular"],
    lastCheckOut: json["lastCheckOut"],
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
    lastPaidSalaryType: json["lastPaidSalaryType"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
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
    "_id": id,
    "displayName": displayName,
    "image": image,
    "username": username,
    "roles": roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
    "active": active,
    "phone": phone,
    "coverImages": coverImages == null
        ? null
        : List<dynamic>.from(coverImages!.map((x) => x)),
    "commissionPercent": commissionPercent,
    "commissionAmount": commissionAmount,
    "about": about,
    "totalOrders": totalOrders,
    "balance": balance,
    "transactionsBalance": transactionsBalance,
    "ratingCount": ratingCount,
    "ratingAvg": ratingAvg,
    "merchantShippingPrice": merchantShippingPrice,
    "popular": popular,
    "lastCheckOut": lastCheckOut,
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
    "lastPaidSalaryType": lastPaidSalaryType,
    "region": region,
    "city": city,
    "discount": discount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class City {
  String? id;
  String? name;
  int? price;
  String? region;
  dynamic merchant;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  City({
    this.id,
    this.name,
    this.price,
    this.region,
    this.merchant,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    price: json['price'] as int?,
    region: json['region'] as String?,
    merchant: json['merchant'] as dynamic,
    deleted: json['deleted'] as bool?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'price': price,
    'region': region,
    'merchant': merchant,
    'deleted': deleted,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };
}

class Region {
  String? id;
  String? name;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Region({
    this.id,
    this.name,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    deleted: json['deleted'] as bool?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'deleted': deleted,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };
}
