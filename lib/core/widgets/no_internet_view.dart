import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 100, color: Colors.grey),
            const Gap(20),
            Text(
              "No Internet Connection",
              style: AppFontStyle.bold20Black1A(context),
            ),
            const Gap(10),
            Text(
              "Please check your internet connection",
              style: AppFontStyle.regular14grey(context),
            ),
          ],
        ),
      ),
    );
  }
}
