import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToastification {
  static void showSuccessToast({
    required BuildContext context,
    required String message,
  }) {
    _showToast(
      context: context,
      message: message,
      type: ToastificationType.success,
      primaryColor: AppColors.green2B,
    );
  }

  static void showFailureToast({
    required BuildContext context,
    required String message,
  }) {
    _showToast(
      context: context,
      message: message,
      type: ToastificationType.error,
      primaryColor: AppColors.red,
    );
  }

  static void showNotificationToast({
    required BuildContext context,
    required String message,
  }) {
    _showToast(
      context: context,
      message: message,
      type: ToastificationType.info,
      primaryColor: AppColors.black1A,
    );
  }

  static void _showToast({
    required BuildContext context,
    required String message,
    required ToastificationType type,
    required Color primaryColor,
  }) {
    // Cancel all previous toasts to show only the last one
    toastification.dismissAll();

    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      primaryColor: primaryColor,
      title: Text(message, style: AppFontStyle.regular16White(context)),
      borderRadius: BorderRadius.circular(24),
      alignment: kIsWeb ? AlignmentDirectional.topEnd : Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      showProgressBar: false,
      closeOnClick: false,
      dragToClose: true,
      borderSide: BorderSide.none,
      showIcon: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
    );
  }
}
