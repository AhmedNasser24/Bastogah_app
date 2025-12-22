// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'city.dart';
import 'client.dart';
import 'item.dart';
import 'merchant_location.dart';
import 'region.dart';

class OrderItemModel {
  String? id;
  String? merchant;
  String? merchantName;
  String? merchantPhone;
  String? billNo;
  List<Item>? items;
  int? totalDiscount;
  int? maxDiscount;
  int? totalAppliedDiscount;
  int? totalAdminDiscount;
  int? totalMerchantDiscount;
  int? discountDiff;
  int? itemsPrice;
  int? shippingPrice;
  int? clientPrice;
  int? driverPrice;
  bool? driverPaid;
  int? appPrice;
  int? merchantPrice;
  bool? merchantPaid;
  int? shippingProfit;
  Client? client;
  String? clientName;
  String? address;
  String? phone;
  double? locationLat;
  double? locationLng;
  Region? region;
  City? city;
  bool? deleted;
  int? status;
  String? driverName;
  int? driverLat;
  int? driverLng;
  int? driverCash;
  dynamic deliveredAt;
  MerchantLocation? merchantLocation;
  String? cancelReason;
  String? notes;
  int? commissionPercent;
  int? commissionAmount;
  List<String>? originalProducts;
  bool? driverSalaryPaid;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  OrderItemModel({
    this.id,
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

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['_id'] as String?,
      merchant: json['merchant'] as String?,
      merchantName: json['merchantName'] as String?,
      merchantPhone: json['merchantPhone'] as String?,
      billNo: json['billNo'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDiscount: json['totalDiscount'] as int?,
      maxDiscount: json['maxDiscount'] as int?,
      totalAppliedDiscount: json['totalAppliedDiscount'] as int?,
      totalAdminDiscount: json['totalAdminDiscount'] as int?,
      totalMerchantDiscount: json['totalMerchantDiscount'] as int?,
      discountDiff: json['discountDiff'] as int?,
      itemsPrice: json['itemsPrice'] as int?,
      shippingPrice: json['shippingPrice'] as int?,
      clientPrice: json['clientPrice'] as int?,
      driverPrice: json['driverPrice'] as int?,
      driverPaid: json['driverPaid'] as bool?,
      appPrice: json['appPrice'] as int?,
      merchantPrice: json['merchantPrice'] as int?,
      merchantPaid: json['merchantPaid'] as bool?,
      shippingProfit: json['shippingProfit'] as int?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      clientName: json['clientName'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      locationLat: (json['locationLat'] as num?)?.toDouble(),
      locationLng: (json['locationLng'] as num?)?.toDouble(),
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      deleted: json['deleted'] as bool?,
      status: json['status'] as int?,
      driverName: json['driverName'] as String?,
      driverLat: json['driverLat'] as int?,
      driverLng: json['driverLng'] as int?,
      driverCash: json['driverCash'] as int?,
      deliveredAt: json['deliveredAt'] as dynamic,
      merchantLocation: json['merchantLocation'] == null
          ? null
          : MerchantLocation.fromJson(
              json['merchantLocation'] as Map<String, dynamic>,
            ),
      cancelReason: json['cancelReason'] as String?,
      notes: json['notes'] as String?,
      commissionPercent: json['commissionPercent'] as int?,
      commissionAmount: json['commissionAmount'] as int?,
      originalProducts: json['originalProducts'] as List<String>?,
      driverSalaryPaid: json['driverSalaryPaid'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'merchant': merchant,
    'merchantName': merchantName,
    'merchantPhone': merchantPhone,
    'billNo': billNo,
    'items': items?.map((e) => e.toJson()).toList(),
    'totalDiscount': totalDiscount,
    'maxDiscount': maxDiscount,
    'totalAppliedDiscount': totalAppliedDiscount,
    'totalAdminDiscount': totalAdminDiscount,
    'totalMerchantDiscount': totalMerchantDiscount,
    'discountDiff': discountDiff,
    'itemsPrice': itemsPrice,
    'shippingPrice': shippingPrice,
    'clientPrice': clientPrice,
    'driverPrice': driverPrice,
    'driverPaid': driverPaid,
    'appPrice': appPrice,
    'merchantPrice': merchantPrice,
    'merchantPaid': merchantPaid,
    'shippingProfit': shippingProfit,
    'client': client?.toJson(),
    'clientName': clientName,
    'address': address,
    'phone': phone,
    'locationLat': locationLat,
    'locationLng': locationLng,
    'region': region?.toJson(),
    'city': city?.toJson(),
    'deleted': deleted,
    'status': status,
    'driverName': driverName,
    'driverLat': driverLat,
    'driverLng': driverLng,
    'driverCash': driverCash,
    'deliveredAt': deliveredAt,
    'merchantLocation': merchantLocation?.toJson(),
    'cancelReason': cancelReason,
    'notes': notes,
    'commissionPercent': commissionPercent,
    'commissionAmount': commissionAmount,
    'originalProducts': originalProducts,
    'driverSalaryPaid': driverSalaryPaid,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OrderItemModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      merchant.hashCode ^
      merchantName.hashCode ^
      merchantPhone.hashCode ^
      billNo.hashCode ^
      items.hashCode ^
      totalDiscount.hashCode ^
      maxDiscount.hashCode ^
      totalAppliedDiscount.hashCode ^
      totalAdminDiscount.hashCode ^
      totalMerchantDiscount.hashCode ^
      discountDiff.hashCode ^
      itemsPrice.hashCode ^
      shippingPrice.hashCode ^
      clientPrice.hashCode ^
      driverPrice.hashCode ^
      driverPaid.hashCode ^
      appPrice.hashCode ^
      merchantPrice.hashCode ^
      merchantPaid.hashCode ^
      shippingProfit.hashCode ^
      client.hashCode ^
      clientName.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      locationLat.hashCode ^
      locationLng.hashCode ^
      region.hashCode ^
      city.hashCode ^
      deleted.hashCode ^
      status.hashCode ^
      driverName.hashCode ^
      driverLat.hashCode ^
      driverLng.hashCode ^
      driverCash.hashCode ^
      deliveredAt.hashCode ^
      merchantLocation.hashCode ^
      cancelReason.hashCode ^
      notes.hashCode ^
      commissionPercent.hashCode ^
      commissionAmount.hashCode ^
      originalProducts.hashCode ^
      driverSalaryPaid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode;
}
