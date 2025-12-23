
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class MerchantAddEditProductAppBar extends StatelessWidget {
  const MerchantAddEditProductAppBar({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const BackArrowButton(),
          const Gap(8),
          Text(
            isEdit
                ? "merchant.edit_product".tr()
                : "merchant.add_product".tr(),
            style: AppFontStyle.bold14black1A(context),
          ),
        ],
      ),
    );
  }
}