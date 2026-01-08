class SliderModel {
  String id;
  String image;
  String videoLink;
  String name;
  MerchantCategory? merchantCategory;
  bool deleted;
  bool isDiscount;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Merchant? merchant;
  Product? product;

  SliderModel({
    required this.id,
    required this.image,
    required this.videoLink,
    required this.name,
    this.merchantCategory,
    required this.deleted,
    required this.isDiscount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.merchant,
    this.product,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    id: json['_id'] as String,
    image: json['image'] as String,
    videoLink: json['videoLink'] as String,
    name: json['name'] as String,
    merchantCategory: json['merchantCategory'] != null
        ? MerchantCategory.fromJson(
            json['merchantCategory'] as Map<String, dynamic>,
          )
        : null,
    deleted: json['deleted'] as bool,
    isDiscount: json['isDiscount'] as bool,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int,
    merchant: json['merchant'] != null
        ? Merchant.fromJson(json['merchant'] as Map<String, dynamic>)
        : null,
    product: json['product'] != null
        ? Product.fromJson(json['product'] as Map<String, dynamic>)
        : null,
  );
  static List<SliderModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => SliderModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

class Merchant {
  dynamic lastPaidSalaryType;
  String id;
  String displayName;
  String image;
  String username;
  List<String> roles;
  bool active;
  String phone;
  List<String> coverImages;
  int commissionPercent;
  dynamic commissionAmount;
  String category;
  String subCategory;
  String about;
  int totalOrders;
  int balance;
  int transactionsBalance;
  int ratingCount;
  int ratingAvg;
  int merchantShippingPrice;
  bool popular;
  MerchantLocation merchantLocation;
  DateTime lastCheckOut;
  String openTime;
  String closeTime;
  int sort;
  int maxDiscount;
  int driverShippingPrice;
  bool online;
  DateTime lastSeen;
  int driverSalaryType;
  dynamic previousType;
  int driverOrderPercent;
  dynamic lastPaidSalaryDate;
  dynamic region;
  dynamic city;
  dynamic discount;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Merchant({
    required this.lastPaidSalaryType,
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
    required this.ratingCount,
    required this.ratingAvg,
    required this.merchantShippingPrice,
    required this.popular,
    required this.merchantLocation,
    required this.lastCheckOut,
    required this.openTime,
    required this.closeTime,
    required this.sort,
    required this.maxDiscount,
    required this.driverShippingPrice,
    required this.online,
    required this.lastSeen,
    required this.driverSalaryType,
    required this.previousType,
    required this.driverOrderPercent,
    required this.lastPaidSalaryDate,
    required this.region,
    required this.city,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    lastPaidSalaryType: json['lastPaidSalaryType'],
    id: json['_id'] as String,
    displayName: json['displayName'] as String,
    image: json['image'] as String,
    username: json['username'] as String,
    roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    active: json['active'] as bool,
    phone: json['phone'] as String,
    coverImages: (json['coverImages'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    commissionPercent: json['commissionPercent'] as int,
    commissionAmount: json['commissionAmount'],
    category: json['category'] as String,
    subCategory: json['subCategory'] as String,
    about: json['about'] as String,
    totalOrders: json['totalOrders'] as int,
    balance: json['balance'] as int,
    transactionsBalance: json['transactionsBalance'] as int,
    ratingCount: json['ratingCount'] as int,
    ratingAvg: json['ratingAvg'] as int,
    merchantShippingPrice: json['merchantShippingPrice'] as int,
    popular: json['popular'] as bool,
    merchantLocation: MerchantLocation.fromJson(
      json['merchantLocation'] as Map<String, dynamic>,
    ),
    lastCheckOut: DateTime.parse(json['lastCheckOut'] as String),
    openTime: json['openTime'] as String,
    closeTime: json['closeTime'] as String,
    sort: json['sort'] as int,
    maxDiscount: json['maxDiscount'] as int,
    driverShippingPrice: json['driverShippingPrice'] as int,
    online: json['online'] as bool,
    lastSeen: DateTime.parse(json['lastSeen'] as String),
    driverSalaryType: json['driverSalaryType'] as int,
    previousType: json['previousType'],
    driverOrderPercent: json['driverOrderPercent'] as int,
    lastPaidSalaryDate: json['lastPaidSalaryDate'],
    region: json['region'],
    city: json['city'],
    discount: json['discount'],
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int,
  );
}

class MerchantLocation {
  String type;
  List<double> coordinates;

  MerchantLocation({required this.type, required this.coordinates});
  factory MerchantLocation.fromJson(Map<String, dynamic> json) =>
      MerchantLocation(
        type: json['type'] as String,
        coordinates: (json['coordinates'] as List<dynamic>)
            .map((e) => (e as num).toDouble())
            .toList(),
      );
}

class MerchantCategory {
  String id;
  String image;
  String coverImage;
  String name;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  MerchantCategory({
    required this.id,
    required this.image,
    required this.coverImage,
    required this.name,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory MerchantCategory.fromJson(Map<String, dynamic> json) =>
      MerchantCategory(
        id: json['_id'] as String,
        image: json['image'] as String,
        coverImage: json['coverImage'] as String,
        name: json['name'] as String,
        deleted: json['deleted'] as bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int,
      );
}

class Product {
  String id;
  List<String> images;
  String name;
  String desc;
  bool productNew;
  bool popular;
  int price;
  int discountAmount;
  int adminDiscountAmount;
  int merchantDiscountAmount;
  int offerDiscount;
  int finalPrice;
  Merchant merchant;
  String category;
  bool active;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  dynamic discount;

  Product({
    required this.id,
    required this.images,
    required this.name,
    required this.desc,
    required this.productNew,
    required this.popular,
    required this.price,
    required this.discountAmount,
    required this.adminDiscountAmount,
    required this.merchantDiscountAmount,
    required this.offerDiscount,
    required this.finalPrice,
    required this.merchant,
    required this.category,
    required this.active,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.discount,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['_id'] as String,
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    name: json['name'] as String,
    desc: json['desc'] as String,
    productNew: json['new'] as bool,
    popular: json['popular'] as bool,
    price: json['price'] as int,
    discountAmount: json['discountAmount'] as int,
    adminDiscountAmount: json['adminDiscountAmount'] as int,
    merchantDiscountAmount: json['merchantDiscountAmount'] as int,
    offerDiscount: json['offerDiscount'] as int,
    finalPrice: json['finalPrice'] as int,
    merchant: Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
    category: json['category'] as String,
    active: json['active'] as bool,
    deleted: json['deleted'] as bool,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int,
    discount: json['discount'],
  );
}
