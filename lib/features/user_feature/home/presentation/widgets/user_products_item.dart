import 'package:bastogah_app/core/widgets/custom_cached_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';
import '../../data/model/user_product_model.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({super.key, this.product});
  final UserProductModel? product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.userProductDetails);
      },
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: product?.images?.isNotEmpty ?? false
                    ? CustomCachedImage(imagePath: product!.images![0])
                    : Image.asset(
                        AppImages.imagesPizzaImage,
                        fit: BoxFit.cover,
                      ),
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
                  Text(
                    "merchant.currency".tr(
                      args: ["${product?.price ?? "لا يوجد سعر"}"],
                    ),
                    style: AppFontStyle.bold14Primary(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
