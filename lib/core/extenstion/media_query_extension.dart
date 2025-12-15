import 'package:bastogah_app/core/responsive_helper/size_config.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isMobile => screenWidth < SizeConfig.mobileBreakpoint;
  bool get isTablet =>
      screenWidth >= SizeConfig.mobileBreakpoint &&
      screenWidth < SizeConfig.tabletBreakpoint;
  bool get isDesktop => screenWidth >= SizeConfig.tabletBreakpoint;
}
