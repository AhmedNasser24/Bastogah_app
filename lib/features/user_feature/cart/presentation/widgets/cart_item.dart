import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../data/model/cart_model.dart';
import 'cart_detect_item_quantity.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.cartModel});
  final CartModel? cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomCachedImage(
                imagePath: cartModel?.userProduct.images?[0] ?? "",
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        cartModel?.userProduct.name ?? "--",
                        style: AppFontStyle.bold14black1A(context),
                      ),
                    ),
                    const Gap(4),
                    GestureDetector(
                      onTap: () {
                        if (cartModel != null) {
                          LocalStorageData.removeCartItem(
                            cartModel!.userProduct.id!,
                          );
                        }
                      },
                      child: SvgPicture.asset(AppIcons.iconsDeleteCartIcon),
                    ),
                  ],
                ),
                const Gap(4),
                Text(
                  cartModel?.userProduct.merchant?.about ?? "--",
                  style: AppFontStyle.regular12grey(context),
                ),
                const Gap(4),
                orderWith(context),
                orderWithout(context),
                if (cartModel?.specialNote.isNotEmpty ?? false) ...[
                  orderNote(context, cartModel!.specialNote),
                ],
                const Gap(8),
                Row(
                  children: [
                    Text(
                      "user.amount".tr(
                        args: [
                          cartModel?.userProduct.finalPrice?.toString() ?? "--",
                        ],
                      ),
                      style: AppFontStyle.bold14Primary(context),
                    ),
                    const Spacer(),
                    CartDetectItemQuantity(cartModel: cartModel),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderWith(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Wrap(
        // runSpacing: 4,
        // spacing: 8,
        children: [
          for (int i = 0; i < 2; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                "+ جبنة تشيدر",
                style: AppFontStyle.regular10Primary(context),
              ),
            ),
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                "+ صلصة",
                style: AppFontStyle.regular10Primary(context),
              ),
            ),
        ],
      ),
    );
  }

  Widget orderWithout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "user.without".tr(),
            style: AppFontStyle.regular10black4B(context),
          ),
          Expanded(
            child: Wrap(
              // runSpacing: 4,
              // spacing: 8,
              children: [
                for (int i = 0; i < 9; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2.0,
                      vertical: 2,
                    ),
                    child: Text(
                      "خس${i != 8 ? "، " : ""}",
                      style: AppFontStyle.regular10black4B(context),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderNote(BuildContext context, String note) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("user.note".tr(), style: AppFontStyle.regular10black4B(context)),
          Expanded(
            child: Text(note, style: AppFontStyle.regular10black4B(context)),
          ),
        ],
      ),
    );
  }
}
