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
    );
  }
}
