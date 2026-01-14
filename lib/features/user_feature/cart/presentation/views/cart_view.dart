import 'dart:developer';

import 'package:bastogah_app/features/user_feature/cart/presentation/widgets/address_section_for_cart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/local_storage_data/local_storage_data.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/cart_payment_section.dart';
import '../widgets/cart_submit_order_button.dart';
import '../widgets/code_discount_field.dart';
import '../widgets/list_of_cart_item.dart';
import '../widgets/order_salary_section_for_cart.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 24,
                    children: [
                      const Gap(0),
                      const ListOfCartItem(),
                      ValueListenableBuilder(
                        valueListenable: LocalStorageData.isCartEmptyNotifier,
                        builder: (context, isCartEmpty, child) {
                          log("hjffffffffffffffffffffffffff");
                          if (isCartEmpty) {
                            return Center(
                              child: Text(
                                "cart_empty".tr(),
                                style: AppFontStyle.bold16Black1A(context),
                              ),
                            );
                          }
                          return const Column(
                            spacing: 24,
                            children: [
                              CodeDiscountField(),
                              AddressSectionForCart(),
                              CartPaymentSection(),
                              OrderSalarySectionForCart(),
                              CartSubmitOrderButton(),
                            ],
                          );
                        },
                      ),
                      const Gap(20),
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
