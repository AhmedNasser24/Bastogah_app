class MerchantProfileModel {
  String id;
  String displayName;
  String image;
  String username;
  List<String> roles;
  bool active;
  String phone;
  List<String> coverImages;
  int commissionPercent;
  int commissionAmount;
  String category;
  String subCategory;
  String about;
  int totalOrders;
  int balance;
  int transactionsBalance;
  bool popular;
  MerchantLocation merchantLocation;
  DateTime lastCheckOut;
  String openTime;
  String closeTime;
  int sort;
  int maxDiscount;
  bool online;
  DateTime lastSeen;
  int driverSalaryType;
  dynamic lastPaidSalaryType;
  dynamic lastPaidSalaryDate;
  dynamic region;
  dynamic city;
  dynamic discount;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  MerchantProfileModel({
    required this.id,
    required this.displayName,
    required this.image,
    required this.username,
    required this.roles,
    required this.active,
    required this.phone,
    required this.coverImages,
    required this.commissionPercent,
    required this.commissionAmount,
    required this.category,
    required this.subCategory,
    required this.about,
    required this.totalOrders,
    required this.balance,
    required this.transactionsBalance,
    required this.popular,
    required this.merchantLocation,
    required this.lastCheckOut,
    required this.openTime,
    required this.closeTime,
    required this.sort,
    required this.maxDiscount,
    required this.online,
    required this.lastSeen,
    required this.driverSalaryType,
    required this.lastPaidSalaryType,
    required this.lastPaidSalaryDate,
    required this.region,
    required this.city,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  factory MerchantProfileModel.fromJson(Map<String, dynamic> json) {
    return MerchantProfileModel(
      id: json['_id'],
      displayName: json['displayName'],
      image: json['image'],
      username: json['username'],
      roles: List<String>.from(json['roles'].map((x) => x)),
      active: json['active'],
      phone: json['phone'],
      coverImages: List<String>.from(json['coverImages'].map((x) => x)),
      commissionPercent: json['commissionPercent'],
      commissionAmount: json['commissionAmount'],
      category: json['category'],
      subCategory: json['subCategory'],
      about: json['about'],
      totalOrders: json['totalOrders'],
      balance: json['balance'],
      transactionsBalance: json['transactionsBalance'],
      popular: json['popular'],
      merchantLocation: MerchantLocation.fromJson(json['merchantLocation']),
      lastCheckOut: DateTime.parse(json['lastCheckOut']),
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      sort: json['sort'],
      maxDiscount: json['maxDiscount'],
      online: json['online'],
      lastSeen: DateTime.parse(json['lastSeen']),
      driverSalaryType: json['driverSalaryType'],
      lastPaidSalaryType: json['lastPaidSalaryType'],
      lastPaidSalaryDate: json['lastPaidSalaryDate'],
      region: json['region'],
      city: json['city'],
      discount: json['discount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'displayName': displayName,
      'image': image,
      'username': username,
      'roles': List<dynamic>.from(roles.map((x) => x)),
      'active': active,
      'phone': phone,
      'coverImages': List<dynamic>.from(coverImages.map((x) => x)),
      'commissionPercent': commissionPercent,
      'commissionAmount': commissionAmount,
      'category': category,
      'subCategory': subCategory,
      'about': about,
      'totalOrders': totalOrders,
      'balance': balance,
      'transactionsBalance': transactionsBalance,
      'popular': popular,
      'merchantLocation': merchantLocation.toJson(),
      'lastCheckOut': lastCheckOut.toIso8601String(),
      'openTime': openTime,
      'closeTime': closeTime,
      'sort': sort,
      'maxDiscount': maxDiscount,
      'online': online,
      'lastSeen': lastSeen.toIso8601String(),
      'driverSalaryType': driverSalaryType,
      'lastPaidSalaryType': lastPaidSalaryType,
      'lastPaidSalaryDate': lastPaidSalaryDate,
      'region': region,
      'city': city,
      'discount': discount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class MerchantLocation {
  String type;
  List<double> coordinates;

  MerchantLocation({required this.type, required this.coordinates});
  factory MerchantLocation.fromJson(Map<String, dynamic> json) {
    return MerchantLocation(
      type: json['type'],
      coordinates: List<double>.from(
        json['coordinates'].map((x) => x.toDouble()),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates};
  }
}
