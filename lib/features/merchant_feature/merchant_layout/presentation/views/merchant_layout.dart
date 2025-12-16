import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:flutter/material.dart';

class MerchantLayout extends StatelessWidget {
  const MerchantLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [MerchantAppBar()]),
        ),
      ),

      floatingActionButton: InkWell(
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
      ),
    );
  }
}
