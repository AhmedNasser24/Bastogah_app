class UserOrderModel {
  final String id;
  final String? merchant;
  final String? merchantName;
  final String? merchantPhone;
  final String? billNo;
  final List<Item>? items;
  final int? totalDiscount;
  final int? maxDiscount;
  final int? totalAppliedDiscount;
  final int? totalAdminDiscount;
  final int? totalMerchantDiscount;
  final int? discountDiff;
  final int? itemsPrice;
  final int? shippingPrice;
  final int? clientPrice;
  final int? driverPrice;
  final bool? driverPaid;
  final int? appPrice;
  final int? merchantPrice;
  final bool? merchantPaid;
  final int? shippingProfit;
  final Client? client;
  final String? clientName;
  final String? address;
  final String? phone;
  final double? locationLat;
  final double? locationLng;
  final City? region;
  final City? city;
  final bool? deleted;
  final int? status;
  final String? driverName;
  final int? driverLat;
  final int? driverLng;
  final int? driverCash;
  final dynamic deliveredAt;
  final MerchantLocation? merchantLocation;
  final String? cancelReason;
  final String? notes;
  final int? commissionPercent;
  final int? commissionAmount;
  final List<String>? originalProducts;
  final bool? driverSalaryPaid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  UserOrderModel({
    required this.id,
    this.merchant,
    this.merchantName,
    this.merchantPhone,
    this.billNo,
    this.items,
    this.totalDiscount,
    this.maxDiscount,
    this.totalAppliedDiscount,
    this.totalAdminDiscount,
    this.totalMerchantDiscount,
    this.discountDiff,
    this.itemsPrice,
    this.shippingPrice,
    this.clientPrice,
    this.driverPrice,
    this.driverPaid,
    this.appPrice,
    this.merchantPrice,
    this.merchantPaid,
    this.shippingProfit,
    this.client,
    this.clientName,
    this.address,
    this.phone,
    this.locationLat,
    this.locationLng,
    this.region,
    this.city,
    this.deleted,
    this.status,
    this.driverName,
    this.driverLat,
    this.driverLng,
    this.driverCash,
    this.deliveredAt,
    this.merchantLocation,
    this.cancelReason,
    this.notes,
    this.commissionPercent,
    this.commissionAmount,
    this.originalProducts,
    this.driverSalaryPaid,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  static List<UserOrderModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserOrderModel.fromJson(json)).toList();
  }

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
    id: json["_id"],
    merchant: json["merchant"],
    merchantName: json["merchantName"],
    merchantPhone: json["merchantPhone"],
    billNo: json["billNo"],
    items: json["items"] == null
        ? []
        : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    totalDiscount: json["totalDiscount"],
    maxDiscount: json["maxDiscount"],
    totalAppliedDiscount: json["totalAppliedDiscount"],
    totalAdminDiscount: json["totalAdminDiscount"],
    totalMerchantDiscount: json["totalMerchantDiscount"],
    discountDiff: json["discountDiff"],
    itemsPrice: json["itemsPrice"],
    shippingPrice: json["shippingPrice"],
    clientPrice: json["clientPrice"],
    driverPrice: json["driverPrice"],
    driverPaid: json["driverPaid"],
    appPrice: json["appPrice"],
    merchantPrice: json["merchantPrice"],
    merchantPaid: json["merchantPaid"],
    shippingProfit: json["shippingProfit"],
    client: json["client"] == null ? null : Client.fromJson(json["client"]),
    clientName: json["clientName"],
    address: json["address"],
    phone: json["phone"],
    locationLat: json["locationLat"]?.toDouble(),
    locationLng: json["locationLng"]?.toDouble(),
    region: json["region"] == null ? null : City.fromJson(json["region"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    deleted: json["deleted"],
    status: json["status"],
    driverName: json["driverName"],
    driverLat: json["driverLat"],
    driverLng: json["driverLng"],
    driverCash: json["driverCash"],
    deliveredAt: json["deliveredAt"],
    merchantLocation: json["merchantLocation"] == null
        ? null
        : MerchantLocation.fromJson(json["merchantLocation"]),
    cancelReason: json["cancelReason"],
    notes: json["notes"],
    commissionPercent: json["commissionPercent"],
    commissionAmount: json["commissionAmount"],
    originalProducts: json["originalProducts"] == null
        ? []
        : List<String>.from(json["originalProducts"]!.map((x) => x)),
    driverSalaryPaid: json["driverSalaryPaid"],
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
    "merchant": merchant,
    "merchantName": merchantName,
    "merchantPhone": merchantPhone,
    "billNo": billNo,
    "items": items == null
        ? []
        : List<dynamic>.from(items!.map((x) => x.toJson())),
    "totalDiscount": totalDiscount,
    "maxDiscount": maxDiscount,
    "totalAppliedDiscount": totalAppliedDiscount,
    "totalAdminDiscount": totalAdminDiscount,
    "totalMerchantDiscount": totalMerchantDiscount,
    "discountDiff": discountDiff,
    "itemsPrice": itemsPrice,
    "shippingPrice": shippingPrice,
    "clientPrice": clientPrice,
    "driverPrice": driverPrice,
    "driverPaid": driverPaid,
    "appPrice": appPrice,
    "merchantPrice": merchantPrice,
    "merchantPaid": merchantPaid,
    "shippingProfit": shippingProfit,
    "client": client?.toJson(),
    "clientName": clientName,
    "address": address,
    "phone": phone,
    "locationLat": locationLat,
    "locationLng": locationLng,
    "region": region?.toJson(),
    "city": city?.toJson(),
    "deleted": deleted,
    "status": status,
    "driverName": driverName,
    "driverLat": driverLat,
    "driverLng": driverLng,
    "driverCash": driverCash,
    "deliveredAt": deliveredAt,
    "merchantLocation": merchantLocation?.toJson(),
    "cancelReason": cancelReason,
    "notes": notes,
    "commissionPercent": commissionPercent,
    "commissionAmount": commissionAmount,
    "originalProducts": originalProducts == null
        ? []
        : List<dynamic>.from(originalProducts!.map((x) => x)),
    "driverSalaryPaid": driverSalaryPaid,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class City {
  final String? id;
  final String? name;

  City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) =>
      City(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}

class Client {
  final String? id;
  final City? region;
  final City? city;

  Client({this.id, this.region, this.city});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["_id"],
    region: json["region"] == null ? null : City.fromJson(json["region"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "region": region?.toJson(),
    "city": city?.toJson(),
  };
}

class Item {
  final String? product;
  final String? productName;
  final int? price;
  final int? discount;
  final int? qty;
  final int? totalPrice;
  final int? totalDiscount;
  final int? appliedDiscount;
  final int? adminDiscountAmount;
  final int? merchantDiscountAmount;
  final String? notes;

  Item({
    this.product,
    this.productName,
    this.price,
    this.discount,
    this.qty,
    this.totalPrice,
    this.totalDiscount,
    this.appliedDiscount,
    this.adminDiscountAmount,
    this.merchantDiscountAmount,
    this.notes,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    product: json["product"],
    productName: json["productName"],
    price: json["price"],
    discount: json["discount"],
    qty: json["qty"],
    totalPrice: json["totalPrice"],
    totalDiscount: json["totalDiscount"],
    appliedDiscount: json["appliedDiscount"],
    adminDiscountAmount: json["adminDiscountAmount"],
    merchantDiscountAmount: json["merchantDiscountAmount"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "productName": productName,
    "price": price,
    "discount": discount,
    "qty": qty,
    "totalPrice": totalPrice,
    "totalDiscount": totalDiscount,
    "appliedDiscount": appliedDiscount,
    "adminDiscountAmount": adminDiscountAmount,
    "merchantDiscountAmount": merchantDiscountAmount,
    "notes": notes,
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
