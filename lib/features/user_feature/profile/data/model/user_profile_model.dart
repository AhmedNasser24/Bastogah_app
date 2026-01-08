class UserProfileModel {
  dynamic lastPaidSalaryType;
  String? id;
  String? displayName;
  String? image;
  String? username;
  List<String>? roles;
  bool? active;
  String? phone;
  List<String>? coverImages;
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
  Region? region;
  City? city;
  dynamic discount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserProfileModel({
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
    this.region,
    this.city,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        lastPaidSalaryType: json['lastPaidSalaryType'] as dynamic,
        id: json['_id'] as String?,
        displayName: json['displayName'] as String?,
        image: json['image'] as String?,
        username: json['username'] as String?,
        roles: json['roles'] as List<String>?,
        active: json['active'] as bool?,
        phone: json['phone'] as String?,
        coverImages: json['coverImages'] as List<String>?,
        commissionPercent: json['commissionPercent'] as int?,
        commissionAmount: json['commissionAmount'] as int?,
        about: json['about'] as String?,
        totalOrders: json['totalOrders'] as int?,
        balance: json['balance'] as int?,
        transactionsBalance: json['transactionsBalance'] as int?,
        ratingCount: json['ratingCount'] as int?,
        ratingAvg: json['ratingAvg'] as int?,
        merchantShippingPrice: json['merchantShippingPrice'] as int?,
        popular: json['popular'] as bool?,
        lastCheckOut: json['lastCheckOut'] as dynamic,
        openTime: json['openTime'] as String?,
        closeTime: json['closeTime'] as String?,
        sort: json['sort'] as int?,
        maxDiscount: json['maxDiscount'] as int?,
        driverShippingPrice: json['driverShippingPrice'] as int?,
        online: json['online'] as bool?,
        lastSeen: json['lastSeen'] == null
            ? null
            : DateTime.parse(json['lastSeen'] as String),
        driverSalaryType: json['driverSalaryType'] as int?,
        previousType: json['previousType'] as dynamic,
        driverOrderPercent: json['driverOrderPercent'] as int?,
        lastPaidSalaryDate: json['lastPaidSalaryDate'] as dynamic,
        region: json['region'] == null
            ? null
            : Region.fromJson(json['region'] as Map<String, dynamic>),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        discount: json['discount'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'lastPaidSalaryType': lastPaidSalaryType,
    '_id': id,
    'displayName': displayName,
    'image': image,
    'username': username,
    'roles': roles,
    'active': active,
    'phone': phone,
    'coverImages': coverImages,
    'commissionPercent': commissionPercent,
    'commissionAmount': commissionAmount,
    'about': about,
    'totalOrders': totalOrders,
    'balance': balance,
    'transactionsBalance': transactionsBalance,
    'ratingCount': ratingCount,
    'ratingAvg': ratingAvg,
    'merchantShippingPrice': merchantShippingPrice,
    'popular': popular,
    'lastCheckOut': lastCheckOut,
    'openTime': openTime,
    'closeTime': closeTime,
    'sort': sort,
    'maxDiscount': maxDiscount,
    'driverShippingPrice': driverShippingPrice,
    'online': online,
    'lastSeen': lastSeen?.toIso8601String(),
    'driverSalaryType': driverSalaryType,
    'previousType': previousType,
    'driverOrderPercent': driverOrderPercent,
    'lastPaidSalaryDate': lastPaidSalaryDate,
    'region': region?.toJson(),
    'city': city?.toJson(),
    'discount': discount,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
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
