import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class MerchantLoginButton extends StatelessWidget {
  const MerchantLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(title: 'merchant.login'.tr(), onTap: () {});
  }
}
