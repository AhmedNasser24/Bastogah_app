import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantCustomerNameField extends StatelessWidget {
  const MerchantCustomerNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: 'merchant.customer_name'.tr(),
      hintText: 'merchant.enter_customer_name'.tr(),
    );
  }
}
