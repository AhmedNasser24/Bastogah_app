import 'dart:math';

import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:bastogah_app/features/merchant_feature/products/presentation/widgets/best_sellers_display.dart';
import 'package:bastogah_app/features/merchant_feature/products/presentation/widgets/save_product_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../widgets/add_product_button.dart';
import '../widgets/merchant_add_edit_product_app_bar.dart';

class MerchantAddOrEditProductView extends StatefulWidget {
  const MerchantAddOrEditProductView({super.key});
  final isEdit = false;
  @override
  State<MerchantAddOrEditProductView> createState() =>
      _MerchantAddOrEditProductViewState();
}

class _MerchantAddOrEditProductViewState
    extends State<MerchantAddOrEditProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 12,
            children: [
              MerchantAddEditProductAppBar(isEdit: widget.isEdit),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 12,
                    children: [
                      CustomTextFormField(
                        title: "merchant.product_name".tr(),
                        hintText: "merchant.enter_product_name".tr(),
                      ),
                      CustomTextFormField(
                        title: "merchant.product_description".tr(),
                        hintText: "merchant.enter_product_description".tr(),
                      ),
                      CustomTextFormField(
                        title: "merchant.product_price".tr(),
                        hintText: "merchant.enter_product_price".tr(),
                      ),
                      CustomTextFormField(
                        title: "merchant.category".tr(),
                        hintText: "merchant.select_category".tr(),
                        readOnly: true,
                        suffixIcon: Transform.rotate(
                          angle: pi / 2,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        title: "merchant.available_additions".tr(),
                        hintText: "merchant.select_available_additions".tr(),
                        readOnly: true,
                        suffixIcon: Transform.rotate(
                          angle: pi / 2,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AppColors.grey,
                          ),
                        ),
                      ),

                      CustomTextFormField(
                        title: "merchant.removable_ingredients".tr(),
                        hintText: "merchant.select_removable_ingredients".tr(),
                        readOnly: true,
                        suffixIcon: Transform.rotate(
                          angle: pi / 2,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      const BestSellersDisplay(),
                      const Gap(20),
                      widget.isEdit
                          ? const SaveProductButton()
                          : const AddProductButton(),
                      const Gap(10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
