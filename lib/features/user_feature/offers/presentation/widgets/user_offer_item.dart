import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_font_style.dart';
import 'user_offer_item_image.dart';

class UserOfferItem extends StatelessWidget {
  const UserOfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RouteName.userOffersDetails),
      child: Card(
        elevation: 1,
        color: Colors.white,

        child: Container(
          // height: 290,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: UserOfferItemImage(),
                  ),
                  Positioned(
                    left: 0,
                    top: 30,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(1.19, 1.19),
                          end: Alignment(0.00, 0.00),
                          colors: [
                            Colors.white,
                            Color(0xFFFFBF7F),
                            Color(0xFFFF9F3F),
                            Color(0xFFFF8F1F),
                            Color(0xFFFF870F),
                            Color(0xFFFF7F00),
                          ],
                        ),
                      ),
                      child: Text(
                        "خصم 25%",
                        style: AppFontStyle.bold16White(context),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 30,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment(1.19, 1.19),
                          end: Alignment(0.00, 0.00),
                          colors: [
                            Colors.white,
                            Color(0xFFFFBF7F),
                            Color(0xFFFF9F3F),
                            Color(0xFFFF8F1F),
                            Color(0xFFFF870F),
                            Color(0xFFFF7F00),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "عرض التفاصيل",
                            style: AppFontStyle.semibold14White(context),
                          ),
                          const Gap(8),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "عروض نهاية الأسبوع",
                  style: AppFontStyle.bold16Black1A(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "خصومات حصرية كل جمعة",
                  style: AppFontStyle.regular14grey(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Gap(8),
            ],
          ),
        ),
      ),
    );
  }
}
