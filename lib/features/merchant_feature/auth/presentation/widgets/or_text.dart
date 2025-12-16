import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrText extends StatelessWidget {
  const OrText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(child: Container(height: 1, decoration: boxDecoration())),
        Text('merchant.or'.tr(), style: AppFontStyle.regular12grey(context)),
        Expanded(child: Container(height: 1, decoration: boxDecoration())),
      ],
    );
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xffD1D5DC), Color(0xff000000), Color(0xffD1D5DC)],
      ),
    );
  }
}
