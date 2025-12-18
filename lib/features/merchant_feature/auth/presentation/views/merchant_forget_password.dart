import 'package:flutter/material.dart';

import '../widgets/forget_password_widgets/create_new_password_body.dart';
import '../widgets/forget_password_widgets/forget_password_body.dart';
import '../widgets/forget_password_widgets/otp_verification_body.dart';

class MerchantForgetPassword extends StatefulWidget {
  const MerchantForgetPassword({super.key});

  @override
  State<MerchantForgetPassword> createState() => _MerchantForgetPasswordState();
}

class _MerchantForgetPasswordState extends State<MerchantForgetPassword> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: const [
            ForgetPasswordBody(),
            OtpVerificationBody(),
            CreateNewPasswordBody(),
          ],
        ),
      ),
    );
  }
}
