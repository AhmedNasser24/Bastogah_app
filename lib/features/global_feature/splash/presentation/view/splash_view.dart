import 'dart:developer';

import 'package:bastogah_app/core/api/api_keys.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.orangeGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(child: Image.asset(AppImages.imagesLogoWhite)),
        ),
      ),
    );
  }

  void _navigateToNext() async {
    // remove this after testing
    // await clearTokens();

    // await Future.delayed(const Duration(seconds: 3), () {
    //   if (mounted) {
    //     if (SharedPreferenceSingleton.getString(
    //       ApiKeys.accessToken,
    //     ).isNotEmpty) {
    //       context.go(RouteName.merchantHome);
    //     } else {
    //       context.go(RouteName.merchantAndDriverLogin);
    //     }
    //   }
    // });
    context.go(RouteName.role);
  }

  Future<void> clearTokens() async {
    log('Clearing tokens for testing purposes');
    await SharedPreferenceSingleton.remove(ApiKeys.accessToken);
    await SharedPreferenceSingleton.remove(ApiKeys.refreshToken);
    await SharedPreferenceSingleton.remove(ApiKeys.userId);
    await SharedPreferenceSingleton.remove(ApiKeys.roles);
  }
}
