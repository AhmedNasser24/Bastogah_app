import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantDeliveryAmountField extends StatelessWidget {
  const MerchantDeliveryAmountField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: 'merchant.delivery_amount'.tr(),
      hintText: 'merchant.enter_delivery_amount'.tr(),
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'merchant.validation.required_field'.tr();
        }
        if (int.tryParse(value) == null) {
          return 'merchant.validation.invalid_number'.tr();
        }
        return null;
      },
    );
  }
}
