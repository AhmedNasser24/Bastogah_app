import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_merchant_bottom_nav_bar.dart';

class MerchantLayout extends StatelessWidget {
  const MerchantLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
      bottomNavigationBar: const CustomMerchantBottomNavBar(),
      floatingActionButton: floatingActionButton(),
    );
  }

  InkWell floatingActionButton() {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: AppColors.orangeGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Icon(Icons.add, size: 32, color: AppColors.white),
      ),
    );
  }
}
