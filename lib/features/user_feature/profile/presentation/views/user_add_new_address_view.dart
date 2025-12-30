import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/user_add_new_address_button.dart';
import '../widgets/user_add_new_address_city_field.dart';
import '../widgets/user_add_new_address_details_field.dart';
import '../widgets/user_add_new_address_governorate_field.dart';
import '../widgets/user_add_new_address_name_field.dart';

class UserAddNewAddressView extends StatelessWidget {
  const UserAddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              appBar(context),
              const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),

                  child: Column(
                    spacing: 12,
                    children: [
                      Gap(10),
                      UserAddNewAddressNameField(),
                      UserAddNewAddressGovernorateField(),
                      UserAddNewAddressCityField(),
                      UserAddNewAddressDetailsField(),
                      Gap(20),
                      UserAddNewAddressButton(),
                      Gap(10),
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
              "user.add_new_address".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
