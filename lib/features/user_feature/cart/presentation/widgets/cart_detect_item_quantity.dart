import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../data/model/cart_model.dart';

class CartDetectItemQuantity extends StatefulWidget {
  const CartDetectItemQuantity({super.key, this.cartModel});
  final CartModel? cartModel;
  @override
  State<CartDetectItemQuantity> createState() => _CartDetectItemQuantityState();
}

class _CartDetectItemQuantityState extends State<CartDetectItemQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            if (widget.cartModel!.quantity > 1) {
              widget.cartModel!.quantity--;
              LocalStorageData.updateCartItemQuantity(widget.cartModel!);
            }
          },

          icon: const Icon(Icons.remove, size: 18, color: AppColors.black1A),
        ),

        Text(
          "${widget.cartModel?.quantity ?? 0}", // This should be the current quantity
          style: AppFontStyle.semibold14black1A(context),
        ),

        IconButton(
          onPressed: () {
            widget.cartModel!.quantity++;
            LocalStorageData.updateCartItemQuantity(widget.cartModel!);
          },
          icon: const Icon(Icons.add, size: 18, color: AppColors.black1A),
        ),
      ],
    );
  }
}
