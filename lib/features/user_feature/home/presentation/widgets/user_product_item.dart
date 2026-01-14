import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:bastogah_app/core/widgets/custom_cached_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../../cart/data/model/cart_model.dart';
import '../../data/model/user_product_model.dart';
import 'product_detect_item_quantity.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({super.key, this.product, this.carts});
  final UserProductModel? product;
  final List<CartModel>? carts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: product?.images?.isNotEmpty ?? false
                  ? CustomCachedImage(imagePath: product!.images![0])
                  : Image.asset(AppImages.imagesPizzaImage, fit: BoxFit.cover),
            ),
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product?.name ?? "لا يوجد اسم",
                  style: AppFontStyle.semibold14black1A(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product?.desc ?? "لا يوجد وصف",
                  style: AppFontStyle.semibold12grey(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "merchant.currency".tr(
                              args: ["${product?.price ?? "لا يوجد سعر"}"],
                            ),
                            style: AppFontStyle.bold14Primary(context),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    const Gap(8),
                    isInCart(product, carts)
                        ? ProductDetectItemQuantity(
                            cartModel: carts?.firstWhere(
                              (element) =>
                                  element.userProduct.id == product!.id,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              if (product != null) {
                                CartModel cardModel = CartModel(
                                  userProduct: product!,
                                  quantity: 1,
                                );
                                LocalStorageData.addToCart(cardModel);
                                CustomToastification.showSuccessToast(
                                  message: "product_added_to_cart".tr(),
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isInCart(UserProductModel? product, List<CartModel>? carts) {
    if (product == null || carts == null) return false;
    return carts.any((element) => element.userProduct.id == product.id);
  }
}
