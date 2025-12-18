import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_icons.dart';
import '../../../../../../core/widgets/custom_button.dart';

class MerchantAddNewOrderButton extends StatelessWidget {
  const MerchantAddNewOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      prefixIcon: AppIcons.iconsAdd24Icon,
      title: "merchant.add_order".tr(),
      onTap: () {},
    );
  }
}
