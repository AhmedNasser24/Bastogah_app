import 'dart:developer';

import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:bastogah_app/core/languages/lang.dart';
import 'package:bastogah_app/core/routing/app_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getThemeLight,
      routerConfig: AppRoute.router,
    );
  }
}
