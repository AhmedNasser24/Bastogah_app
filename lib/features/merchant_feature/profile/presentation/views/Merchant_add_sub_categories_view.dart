import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/back_arrow_button.dart';
import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/add_another_category_button.dart';

class MerchantAddSubCategoriesView extends StatelessWidget {
  const MerchantAddSubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              appBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      const Gap(15),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "merchant.profile.restaurant_category".tr(),
                          style: AppFontStyle.regular16black1A(context),
                        ),
                      ),
                      CustomTextFormField(hintText: "burger".tr()),
                      CustomTextFormField(hintText: "sandwich".tr()),
                      const AddAnotherCategoryButton(),
                      const Gap(20),
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

  Widget appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Row(
          children: [
            const BackArrowButton(),
            const Gap(8),
            Text(
              "merchant.profile.add_subcategories".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
