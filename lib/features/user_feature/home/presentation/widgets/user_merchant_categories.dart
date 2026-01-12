import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/core/widgets/custom_cached_image.dart';
import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/merchant_categories_cubit/merchant_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';
import '../../data/model/merchant_category_model.dart';

class UserMerchantCategories extends StatefulWidget {
  const UserMerchantCategories({super.key});

  @override
  State<UserMerchantCategories> createState() => _UserMerchantCategoriesState();
}

class _UserMerchantCategoriesState extends State<UserMerchantCategories> {
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
                        (merchantCategory) => GestureDetector(
                          onTap: () {
                            context.push(
                              RouteName.userMerchants,
                              extra: merchantCategory,
                            );
                          },
                          child: merchantCategoryItem(
                            context,
                            merchantCategory: merchantCategory,
                          ),
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: merchantCategory?.image != null
                ? CustomCachedImage(imagePath: merchantCategory!.image!)
                : Image.asset(AppImages.imagesClothes, fit: BoxFit.cover),
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
