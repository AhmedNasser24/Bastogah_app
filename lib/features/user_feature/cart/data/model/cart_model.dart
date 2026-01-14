import '../../../home/data/model/user_product_model.dart';

class CartModel {
  final UserProductModel userProduct;
  int quantity;
  String specialNote;
  CartModel({
    required this.userProduct,
    required this.quantity,
    this.specialNote = "",
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    userProduct: UserProductModel.fromJson(json['userProduct']),
    quantity: json['quantity'],
    specialNote: json['specialNote'] ?? "",
  );

  Map<String, dynamic> toJson() => {
    'userProduct': userProduct.toJson(),
    'quantity': quantity,
    'specialNote': specialNote,
  };

  static List<CartModel> fromJsonList(List<dynamic> json) =>
      json.map((e) => CartModel.fromJson(e)).toList();

  static List<Map<String, dynamic>> toJsonList(List<CartModel> cart) =>
      cart.map((e) => e.toJson()).toList();
}
