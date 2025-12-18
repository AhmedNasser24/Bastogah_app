import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantTotalAmountField extends StatelessWidget {
  const MerchantTotalAmountField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: 'merchant.total_amount'.tr(),
      hintText: 'merchant.enter_total_amount'.tr(),
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
