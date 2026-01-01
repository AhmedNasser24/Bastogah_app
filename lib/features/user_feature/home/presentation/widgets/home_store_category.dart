import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeStoreCategory extends StatefulWidget {
  const HomeStoreCategory({super.key});

  @override
  State<HomeStoreCategory> createState() => _HomeStoreCategoryState();
}

class _HomeStoreCategoryState extends State<HomeStoreCategory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA3B273),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(AppImages.imagesClothes),
                      ),
                    ),
                    const Gap(8),
                    SizedBox(
                      width: 75,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "ملابس",
                          style: AppFontStyle.regular10black4B(context),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
