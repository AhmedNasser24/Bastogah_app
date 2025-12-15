import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../responsive_helper/responsive_size.dart';

class AppFontStyle {
  static TextStyle bold16White(BuildContext context) => TextStyle(
    color: AppColors.white,
    fontSize: responsiveSize(context, 16),
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold30black1A(BuildContext context) => TextStyle(
    color: AppColors.black1A,
    fontSize: responsiveSize(context, 30),
    fontWeight: FontWeight.bold,
  );
  static TextStyle regular16grey(BuildContext context) => TextStyle(
    color: AppColors.grey,
    fontSize: responsiveSize(context, 16),
    fontWeight: FontWeight.normal,
  );
  static TextStyle regular16black1A(BuildContext context) => TextStyle(
    color: AppColors.black1A,
    fontSize: responsiveSize(context, 16),
    fontWeight: FontWeight.normal,
  );
}
