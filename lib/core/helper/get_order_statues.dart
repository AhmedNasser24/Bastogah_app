import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

(String, Color) getOrderStatues(int? status) {
  switch (status) {
    case 0:
      return ("merchant.filter.pending".tr(), AppColors.yellow);
    case 1:
      return ("merchant.filter.waiting_for_driver".tr(), AppColors.purple);
    case 2:
      return ("merchant.filter.in_progress".tr(), AppColors.primary);
    case 3:
      return ("merchant.filter.completed".tr(), AppColors.green);
    case 4:
      return ("merchant.filter.cancelled".tr(), AppColors.red);
    default:
      return ("no status", Colors.blue);
  }
}
