import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantCustomerPhoneField extends StatelessWidget {
  const MerchantCustomerPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: 'merchant.customer_phone'.tr(),
      hintText: 'merchant.enter_customer_phone'.tr(),
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
