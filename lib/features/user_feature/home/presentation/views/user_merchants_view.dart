import 'dart:async';

import 'package:bastogah_app/core/widgets/back_arrow_button.dart';
import 'package:bastogah_app/core/widgets/cart_icon_button.dart';
import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/merchant_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/notification_icon_button.dart';
import '../../data/params/user_merchant_param.dart';
import '../manager/user_merchants_cubit/user_merchants_cubit.dart';
import '../widgets/user_merchant_list.dart';

class UserMerchantsView extends StatefulWidget {
  const UserMerchantsView({super.key, required this.merchantCategoryModel});
  final MerchantCategoryModel merchantCategoryModel;
  @override
  State<UserMerchantsView> createState() => _UserMerchantsViewState();
}

class _UserMerchantsViewState extends State<UserMerchantsView> {
  late UserMerchantsCubit userMerchantsCubit;
  ScrollController controller = ScrollController();
  late UserMerchantParam userMerchantParam;
  Timer? _debounce;
  @override
  void initState() {
    userMerchantParam = UserMerchantParam(
      categoryId: widget.merchantCategoryModel.id!,
    );
    userMerchantsCubit = getIt<UserMerchantsCubit>();
    userMerchantsCubit.init(userMerchantParam: userMerchantParam);
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          userMerchantsCubit.moreItem &&
          !userMerchantsCubit.isLoadingMore) {
        userMerchantsCubit.loadMoreMerchants(
          userMerchantParam: userMerchantParam,
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      userMerchantParam.searchText = query;
      userMerchantsCubit.loadMerchants(userMerchantParam: userMerchantParam);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userMerchantsCubit,
      child: Column(
        children: [
          appBar(
            context,
            title: widget.merchantCategoryModel.name ?? "لا يوجد اسم",
          ),
          CustomSearchField(onChanged: _onSearchChanged),

          const Gap(12),
          Expanded(
            child: UserMerchantsList(userMerchantParam: userMerchantParam),
          ),
        ],
      ),
    );
  }

  Widget appBar(BuildContext context, {required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        width: double.infinity,
        child: Row(
          children: [
            const BackArrowButton(),
            const Gap(10),
            Text(
              title,
              style: AppFontStyle.semibold20black1A(context),
              overflow: TextOverflow.fade,
            ),
            const Spacer(),
            const CartIconButton(),
            const Gap(8),
            const NotificationIconButton(isThereNewNotification: true),
          ],
        ),
      ),
    );
  }
}
