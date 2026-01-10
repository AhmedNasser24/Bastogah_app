import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomFlutterToast {
  static void showSuccessToast(String message) =>
      _showToast(message: message, backgroundColor: AppColors.green);

  static void showErrorToast(String message) =>
      _showToast(message: message, backgroundColor: AppColors.red);

  static void _showToast({
    required String message,
    required Color backgroundColor,
  }) {
    if (Fluttertoast.isCurrentlyShowingToast) {
      Fluttertoast.cancel();
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG, // time length
      gravity: ToastGravity.TOP,

      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
