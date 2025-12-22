import 'package:collection/collection.dart';

class Item {
  String? product;
  String? productName;
  int? price;
  int? discount;
  int? qty;
  int? totalPrice;
  int? totalDiscount;
  int? appliedDiscount;
  int? adminDiscountAmount;
  int? merchantDiscountAmount;
  String? notes;

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
    product: json['product'] as String?,
    productName: json['productName'] as String?,
    price: json['price'] as int?,
    discount: json['discount'] as int?,
    qty: json['qty'] as int?,
    totalPrice: json['totalPrice'] as int?,
    totalDiscount: json['totalDiscount'] as int?,
    appliedDiscount: json['appliedDiscount'] as int?,
    adminDiscountAmount: json['adminDiscountAmount'] as int?,
    merchantDiscountAmount: json['merchantDiscountAmount'] as int?,
    notes: json['notes'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'product': product,
    'productName': productName,
    'price': price,
    'discount': discount,
    'qty': qty,
    'totalPrice': totalPrice,
    'totalDiscount': totalDiscount,
    'appliedDiscount': appliedDiscount,
    'adminDiscountAmount': adminDiscountAmount,
    'merchantDiscountAmount': merchantDiscountAmount,
    'notes': notes,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Item) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      product.hashCode ^
      productName.hashCode ^
      price.hashCode ^
      discount.hashCode ^
      qty.hashCode ^
      totalPrice.hashCode ^
      totalDiscount.hashCode ^
      appliedDiscount.hashCode ^
      adminDiscountAmount.hashCode ^
      merchantDiscountAmount.hashCode ^
      notes.hashCode;
}
