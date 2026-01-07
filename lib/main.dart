import 'dart:developer';
import 'dart:ui';

import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:bastogah_app/core/languages/lang.dart';
import 'package:bastogah_app/core/routing/app_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dependency_injection/get_it_setup.dart';
import 'core/local_storage_services/shared_preference_singleton.dart'
    show SharedPreferenceSingleton;
import 'core/network/check_network_connection.dart';
import 'core/simple_bloc_observer.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    SharedPreferenceSingleton.init(),
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: localePath, // <-- change the path of the translation files
      fallbackLocale: arabicLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log("width : ${context.screenWidth}");
    log("height : ${context.screenHeight}");
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        overscroll: true,
        scrollbars: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getThemeLight,
      routerConfig: appRouter,
    );
  }
}
