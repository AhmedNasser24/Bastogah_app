import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_product_model.dart';
import '../../../domain/repo/user_home_repo.dart';
part 'user_products_state.dart';

class UserProductsCubit extends Cubit<UserProductsState> {
  UserProductsCubit({required this.userHomeRepo})
    : super(UserProductsInitial());
  final UserHomeRepo userHomeRepo;

  // int _skip = 0;
  // bool moreItem = true;
  // final int maxItem = 20;
  // List<UserProductModel> _products = [];

  // void fetchOrders({required int status}) async {
  //   _skip = 0;
  //   moreItem = true;
  //   _products.clear();

  //   emit(UserProductsLoading());
  //   log("loading");
  //   // _currentStatus = status;
  //   var result = await userHomeRepo.fetchOrders(skip: _skip, status: status);
  //   result.fold(
  //     (failure) => emit(UserProductsFailure(errorMessage: failure.errMessage)),
  //     (orders) {
  //       moreItem = orders.length == maxItem;
  //       _orders = orders;
  //       if (moreItem) {
  //         _skip += 20;
  //       }
  //       log(orders.toString());
  //       emit(
  //         UserProductsSuccessFull(
  //           products: _products,
  //           moreItem: moreItem,
  //         ),
  //       );
  //     },
  //   );
  // }

  // void fetchMoreOrders() async {
  //   if (!moreItem) return;
  //   var result = await userHomeRepo.fetchOrders(
  //     skip: _skip,
  //   );
  //   result.fold(
  //     (failure) => emit(UserProductsFailure(errorMessage: failure.errMessage)),
  //     (orders) {
  //       moreItem = orders.length == maxItem;
  //       _products.addAll(orders);
  //       if (moreItem) {
  //         _skip += 20;
  //       }
  //       emit(
  //         UserProductsSuccessFull(
  //           products: _products,
  //           moreItem: moreItem,
  //         ),
  //       );
  //     },
  //   );
  // }

  // void refresh() {
  //   fetchOrders();
  // }
}
