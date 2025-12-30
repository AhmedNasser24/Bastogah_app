import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_images.dart';

class UserMyRatingItem extends StatelessWidget {
  const UserMyRatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                AppImages.imagesResturantLogo,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "شاورما كورنر",
                          style: AppFontStyle.regular14black4B(context),
                        ),
                      ),
                      const Gap(8),
                      ...List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: SvgPicture.asset(AppIcons.iconsStar),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "تجربة مذهلة! كانت الأطباق مبتكرة ومليئة بالنكهات الغنية. كان الطاهي مبدعًا في تقديم الأطباق. إنه مكان يستحق الزيارة مرة أخرى بالتأكيد.",
                    style: AppFontStyle.regular14grey(context),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "12/02/2025",
                      style: AppFontStyle.regular10grey(context),
                    ),
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
