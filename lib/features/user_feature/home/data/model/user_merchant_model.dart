class UserMerchantModel {
  final dynamic lastPaidSalaryType;
  final String? id;
  final String? displayName;
  final String? image;
  final String? username;
  final List<dynamic>? roles;
  final bool? active;
  final String? phone;
  final List<dynamic>? coverImages;
  final int? commissionPercent;
  final int? commissionAmount;
  final Category? category;
  final Category? subCategory;
  final String? about;
  final int? totalOrders;
  final int? balance;
  final int? transactionsBalance;
  final int? ratingCount;
  final num? ratingAvg;
  final int? merchantShippingPrice;
  final bool? popular;
  final MerchantLocation? merchantLocation;
  final String? lastCheckOut;
  final String? openTime;
  final String? closeTime;
  final int? sort;
  final int? maxDiscount;
  final int? driverShippingPrice;
  final bool? online;
  final String? lastSeen;
  final int? driverSalaryType;
  final dynamic previousType;
  final int? driverOrderPercent;
  final dynamic lastPaidSalaryDate;
  final dynamic region;
  final dynamic city;
  final dynamic discount;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  UserMerchantModel({
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
  factory UserMerchantModel.fromJson(Map<String, dynamic> json) =>
      UserMerchantModel(
        lastPaidSalaryType: json['lastPaidSalaryType'] as dynamic,
        id: json['_id'] as String?,
        displayName: json['displayName'] as String?,
        image: json['image'] as String?,
        username: json['username'] as String?,
        roles: json['roles'] as List<dynamic>?,
        active: json['active'] as bool?,
        phone: json['phone'] as String?,
        coverImages: json['coverImages'] as List<dynamic>?,
        commissionPercent: json['commissionPercent'] as int?,
        commissionAmount: json['commissionAmount'] as int?,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        subCategory: Category.fromJson(
          json['subCategory'] as Map<String, dynamic>,
        ),
        about: json['about'] as String?,
        totalOrders: json['totalOrders'] as int?,
        balance: json['balance'] as int?,
        transactionsBalance: json['transactionsBalance'] as int?,
        ratingCount: json['ratingCount'] as int?,
        ratingAvg: json['ratingAvg'] as num?,
        merchantShippingPrice: json['merchantShippingPrice'] as int?,
        popular: json['popular'] as bool?,
        merchantLocation: MerchantLocation.fromJson(
          json['merchantLocation'] as Map<String, dynamic>,
        ),
        lastCheckOut: json['lastCheckOut'] as String?,
        openTime: json['openTime'] as String?,
        closeTime: json['closeTime'] as String?,
        sort: json['sort'] as int?,
        maxDiscount: json['maxDiscount'] as int?,
        driverShippingPrice: json['driverShippingPrice'] as int?,
        online: json['online'] as bool?,
        lastSeen: json['lastSeen'] as String?,
        driverSalaryType: json['driverSalaryType'] as int?,
        previousType: json['previousType'] as dynamic,
        driverOrderPercent: json['driverOrderPercent'] as int?,
        lastPaidSalaryDate: json['lastPaidSalaryDate'] as dynamic,
        region: json['region'] as dynamic,
        city: json['city'] as dynamic,
        discount: json['discount'] as dynamic,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
      );

  static List<UserMerchantModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => UserMerchantModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<UserMerchantModel> list) {
    return list.map((e) => e.toJson()).toList();
  }

  Map<String, dynamic> toJson() => {
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
    'category': category?.toJson(),
    'subCategory': subCategory?.toJson(),
    'about': about,
    'totalOrders': totalOrders,
    'balance': balance,
    'transactionsBalance': transactionsBalance,
    'ratingCount': ratingCount,
    'ratingAvg': ratingAvg,
    'merchantShippingPrice': merchantShippingPrice,
    'popular': popular,
    'merchantLocation': merchantLocation?.toJson(),
    'lastCheckOut': lastCheckOut,
    'openTime': openTime,
    'closeTime': closeTime,
    'sort': sort,
    'maxDiscount': maxDiscount,
    'driverShippingPrice': driverShippingPrice,
    'online': online,
    'lastSeen': lastSeen,
    'driverSalaryType': driverSalaryType,
    'previousType': previousType,
    'driverOrderPercent': driverOrderPercent,
    'lastPaidSalaryDate': lastPaidSalaryDate,
    'region': region,
    'city': city,
    'discount': discount,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}

class Category {
  final String? id;
  final String? name;

  Category({this.id, this.name});
  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'] as String?, name: json['name'] as String?);
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class MerchantLocation {
  final String? type;
  final List<dynamic>? coordinates;

  MerchantLocation({this.type, this.coordinates});

  factory MerchantLocation.fromJson(Map<String, dynamic> json) =>
      MerchantLocation(
        type: json['type'] as String?,
        coordinates: json['coordinates'] as List<dynamic>?,
      );
  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}
