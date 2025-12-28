import 'package:flutter/material.dart';

import '../widgets/forget_password_widgets/create_new_password_body.dart';
import '../widgets/forget_password_widgets/forget_password_body.dart';
import '../widgets/forget_password_widgets/otp_verification_body.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            ForgetPasswordBody(pageController: _pageController),
            OtpVerificationBody(pageController: _pageController),
            CreateNewPasswordBody(pageController: _pageController),
          ],
        ),
      ),
    );
  }
}
