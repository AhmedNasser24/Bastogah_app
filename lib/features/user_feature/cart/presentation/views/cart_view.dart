import 'package:bastogah_app/features/user_feature/cart/presentation/widgets/cart_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/cart_submit_order_button.dart';
import '../widgets/code_discount_field.dart';
import '../widgets/order_salary_section_for_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 24,
                    children: [
                      CartItem(),
                      CodeDiscountField(),
                      OrderSalarySectionForCart(),
                      CartSubmitOrderButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 60,
        child: Center(
          child: Row(
            children: [
              const BackArrowButton(),
              const Gap(8),
              Text(
                "user.cart".tr(),
                style: AppFontStyle.bold16Black1A(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
