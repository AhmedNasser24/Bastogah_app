import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../cart/data/model/cart_model.dart';

class ProductDetectItemQuantity extends StatefulWidget {
  const ProductDetectItemQuantity({super.key, this.cartModel});
  final CartModel? cartModel;
  @override
  State<ProductDetectItemQuantity> createState() =>
      _ProductDetectItemQuantityState();
}

class _ProductDetectItemQuantityState extends State<ProductDetectItemQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.cartModel!.quantity > 1) {
              widget.cartModel!.quantity--;
              LocalStorageData.updateCartItemQuantity(widget.cartModel!);
            } else {
              LocalStorageData.removeCartItem(
                widget.cartModel!.userProduct.id!,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary,
            ),
            child: const Icon(Icons.remove, size: 18, color: AppColors.primary),
          ),
        ),
        Text(
          "${widget.cartModel?.quantity ?? 0}",
          style: AppFontStyle.semibold14black1A(context),
        ),

        GestureDetector(
          onTap: () {
            widget.cartModel!.quantity++;
            LocalStorageData.updateCartItemQuantity(widget.cartModel!);
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary,
            ),
            child: const Icon(Icons.add, size: 18, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
