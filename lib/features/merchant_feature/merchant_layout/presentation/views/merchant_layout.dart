import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:flutter/material.dart';

class MerchantLayout extends StatelessWidget {
  const MerchantLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [MerchantAppBar()]),
        ),
      ),
    );
  }
}
