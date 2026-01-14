import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/local_storage_data/local_storage_data.dart';
import '../../../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> getCart() {
    emit(CartLoading());
    try {
      final cart = LocalStorageData.getCart();
      emit(CartLoaded(cart: cart));
      return cart;
    } catch (e) {
      emit(CartFailure(message: e.toString()));
      return [];
    }
  }

  void removeCartItem(String id) async {
    try {
      await LocalStorageData.removeCartItem(id);
      emit(CartLoaded(cart: LocalStorageData.getCart()));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }

  void updateCartItemQuantity(CartModel cartModel) async {
    try {
      await LocalStorageData.updateCartItemQuantity(cartModel);
      emit(CartLoaded(cart: LocalStorageData.getCart()));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }
}
