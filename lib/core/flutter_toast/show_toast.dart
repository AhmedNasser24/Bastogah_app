import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSuccessToast(String message) => Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_LONG, // time length
  gravity: ToastGravity.TOP,
  timeInSecForIosWeb: 5,
  backgroundColor: AppColors.green,
  textColor: Colors.white,
  fontSize: 16.0,
);

void showErrorToast(String message) => Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_LONG, // time length
  gravity: ToastGravity.TOP,

  timeInSecForIosWeb: 5,
  backgroundColor: AppColors.red,
  textColor: Colors.white,
  fontSize: 16.0,
);
