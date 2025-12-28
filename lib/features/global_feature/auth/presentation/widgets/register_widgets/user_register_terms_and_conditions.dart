import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../merchant_feature/products/presentation/widgets/custom_check_box.dart';

class UserRegisterTermsAndConditions extends StatelessWidget {
  const UserRegisterTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        const Gap(8),
        Expanded(
          child: Text(
            "auth.user_register_terms_and_conditions".tr(),
            style: AppFontStyle.regular12grey(context),
          ),
        ),
      ],
    );
  }
}
