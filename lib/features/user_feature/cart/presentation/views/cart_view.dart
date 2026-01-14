import 'package:bastogah_app/features/user_feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:bastogah_app/features/user_feature/cart/presentation/widgets/address_section_for_cart.dart';
import 'package:bastogah_app/features/user_feature/cart/presentation/widgets/cart_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
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
  late CartCubit cartCubit;
  @override
  void initState() {
    cartCubit = getIt<CartCubit>()..getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cartCubit,
      child: Scaffold(
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
                        Gap(0),
                        ListOfCartItem(),
                        CodeDiscountField(),
                        AddressSectionForCart(),
                        CartPaymentSection(),
                        OrderSalarySectionForCart(),
                        CartSubmitOrderButton(),
                        Gap(20),
                      ],
                    ),
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
