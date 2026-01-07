import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/back_arrow_button.dart';
import '../../../../global_feature/get_city_region/presentation/manager/city_region_cubit/city_region_cubit.dart';
import '../widgets/merchant_add_new_order_widgets/merchant_add_new_order_button.dart'
    show MerchantAddNewOrderButton;
import '../widgets/merchant_add_new_order_widgets/merchant_address_field.dart';
import '../widgets/merchant_add_new_order_widgets/merchant_custome_name_field.dart';
import '../widgets/merchant_add_new_order_widgets/merchant_customer_phone_field.dart';
import '../widgets/merchant_add_new_order_widgets/merchant_delivery_amount_field.dart';
import '../widgets/merchant_add_new_order_widgets/merchant_total_amount_field.dart';

class MerchantAddNewOrderView extends StatefulWidget {
  const MerchantAddNewOrderView({super.key});

  @override
  State<MerchantAddNewOrderView> createState() =>
      _MerchantAddNewOrderViewState();
}

class _MerchantAddNewOrderViewState extends State<MerchantAddNewOrderView> {
  late CityRegionCubit cityRegionCubit;
  @override
  void initState() {
    super.initState();
    cityRegionCubit = getIt<CityRegionCubit>();
    cityRegionCubit.fetchRegions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cityRegionCubit,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const AppBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        const Gap(20),
                        Text(
                          'merchant.order_info'.tr(),
                          style: AppFontStyle.bold20Black1A(context),
                        ),
                        Text(
                          'merchant.enter_new_order_details'.tr(),
                          style: AppFontStyle.semibold14grey(context),
                        ),
                        const MerchantCustomerNameField(),
                        const MerchantCustomerPhoneField(),
                        const MerchantAddressField(),
                        const MerchantTotalAmountField(),
                        const MerchantDeliveryAmountField(),
                        const Gap(20),
                        const MerchantAddNewOrderButton(),
                        const Gap(20),
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
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          spacing: 10,
          children: [
            const BackArrowButton(),
            Text(
              'merchant.add_new_order'.tr(),
              style: AppFontStyle.bold14black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
