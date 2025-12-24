import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';

class MerchantProductItem extends StatelessWidget {
  const MerchantProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.merchantProductDetails);
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
                image: const DecorationImage(
                  image: AssetImage(AppImages.imagesPizzaImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "بيتزا لحم",
                    style: AppFontStyle.semibold14black1A(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "عجينة البيتزا, صلصة البيتزا, شاورما لحم, جبنة الموزريلا, فلفل, زيتون",
                    style: AppFontStyle.semibold12grey(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "merchant.currency".tr(args: ["5000"]),
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
