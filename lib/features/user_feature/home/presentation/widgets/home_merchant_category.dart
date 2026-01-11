import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/core/widgets/custom_cached_image.dart';
import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/merchant_categories_cubit/merchant_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../data/model/merchant_category_model.dart';

class HomeMerchantCategory extends StatefulWidget {
  const HomeMerchantCategory({super.key});

  @override
  State<HomeMerchantCategory> createState() => _HomeMerchantCategoryState();
}

class _HomeMerchantCategoryState extends State<HomeMerchantCategory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<MerchantCategoriesCubit, MerchantCategoriesState>(
            builder: (context, state) {
              if (state is MerchantCategoriesSuccess) {
                return Row(
                  children: state.merchantCategories
                      .map(
                        (merchantCategory) => merchantCategoryItem(
                          context,
                          merchantCategory: merchantCategory,
                        ),
                      )
                      .toList(),
                );
              } else {
                return Row(
                  children: List.generate(
                    10,
                    (index) => CustomSkeletonizer(
                      child: merchantCategoryItem(context),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Padding merchantCategoryItem(
    BuildContext context, {
    MerchantCategoryModel? merchantCategory,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            // padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFA3B273),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: merchantCategory?.image != null
                  ? CustomCachedImage(imagePath: merchantCategory!.image!)
                  : Image.asset(AppImages.imagesClothes, fit: BoxFit.cover),
            ),
          ),
          const Gap(8),
          SizedBox(
            width: 75,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                merchantCategory?.name ?? "ملابس",
                style: AppFontStyle.regular10black4B(context),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
