import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/user_merchant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';
import '../../data/params/user_product_param.dart';
import '../manager/user_products_cubit/user_products_cubit.dart';
import '../widgets/user_products_app_bar.dart';
import '../widgets/user_products_filter.dart';
import '../widgets/user_products_list.dart';

class UserProductsView extends StatefulWidget {
  const UserProductsView({super.key, required this.userMerchantModel});
  final UserMerchantModel userMerchantModel;
  @override
  State<UserProductsView> createState() => _UserProductsViewState();
}

class _UserProductsViewState extends State<UserProductsView> {
  ScrollController controller = ScrollController();
  late UserProductParam userProductParam;
  late UserProductsCubit userProductsCubit;
  @override
  void initState() {
    userProductsCubit = getIt<UserProductsCubit>();
    userProductParam = UserProductParam(
      merchantId: widget.userMerchantModel.id!,
    );
    userProductsCubit.fetchProducts(userProductParam: userProductParam);
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          userProductsCubit.moreItem &&
          !userProductsCubit.isLoadingMore) {
        userProductsCubit.fetchMoreProducts(userProductParam: userProductParam);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userProductsCubit,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            controller: controller,
            slivers: [
              UserProductsAppBar(image: widget.userMerchantModel.image ?? ""),
              SliverToBoxAdapter(
                child: ResturantInfoSection(merchant: widget.userMerchantModel),
              ),
              const SliverGap(16),
              const SliverToBoxAdapter(child: UserProductFilter()),
              const SliverGap(16),

              const SliverToBoxAdapter(child: UserProductsList()),
              const SliverGap(20),
            ],
          ),
        ),
      ),
    );
  }
}

class ResturantInfoSection extends StatelessWidget {
  const ResturantInfoSection({super.key, required this.merchant});
  final UserMerchantModel merchant;
  @override
  Widget build(BuildContext context) {
    return Row(
      // need this row for making box constraint work
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Center(
            child: GestureDetector(
              onTap: () =>
                  context.push(RouteName.userStoreRating, extra: merchant),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(maxWidth: 600),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    resturantLogo(),
                    const Gap(8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  merchant.displayName ?? "لا يوجد اسم",
                                  style: AppFontStyle.bold18Black1A(context),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Gap(8),
                              SvgPicture.asset(AppIcons.iconsInfo28BlackIcon),
                            ],
                          ),
                          Text(
                            merchant.about ?? "لا يوجد معلومات",
                            style: AppFontStyle.medium14black4B(context),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          resturantRating(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container resturantLogo() {
    return Container(
      width: 65,
      height: 65,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.5),
        child: Image.asset(AppImages.imagesResturantLogo, fit: BoxFit.cover),
      ),
    );
  }

  Widget resturantRating(BuildContext context) {
    num rating = merchant.ratingAvg ?? 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.00, 0.00),
          end: Alignment(1.00, 1.00),
          colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.iconsStar12White),
          const Gap(4),
          Text("$rating", style: AppFontStyle.bold14White(context)),
        ],
      ),
    );
  }
}
