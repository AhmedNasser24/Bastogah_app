import 'package:flutter/material.dart';

import '../extenstion/media_query_extension.dart';
import 'size_config.dart';

double responsiveSize(BuildContext context, double size) {
  double scaleFactor = getScaleFactor(context);
  // double lowerLimit = context.isMobile ? size * 1 : size * 1;
  // double upperLimit = context.isMobile ? size * 1 : size * 1;
  // size = size * scaleFactor;

  return size;
}

double getScaleFactor(BuildContext context) {
  double screenWidth = context.screenWidth;

  if (screenWidth < SizeConfig.mobileBreakpoint) {
    return screenWidth / 360; // Mobile
  } else if (screenWidth < SizeConfig.tabletBreakpoint) {
    return screenWidth / 1000; // Tablet
  } else {
    return screenWidth / 1500; // Desktop
  }
}
