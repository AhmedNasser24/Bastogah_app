import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> buildPageWithSlideTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  TextDirection? textDirection,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const slideBegin = Offset(1.0, 0.0);
      const slideEnd = Offset.zero;
      const slideCurve = Curves.easeOutCubic;
      var slideTween = Tween(
        begin: slideBegin,
        end: slideEnd,
      ).chain(CurveTween(curve: slideCurve));
      var slideAnimation = animation.drive(slideTween);

      const fadeBegin = 1.0;
      const fadeEnd = 0.0;
      var fadeOutTween = Tween(
        begin: fadeBegin,
        end: fadeEnd,
      ).chain(CurveTween(curve: Curves.easeOutCubic));
      var fadeOutAnimation = secondaryAnimation.drive(fadeOutTween);

      return AnimatedBuilder(
        animation: secondaryAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: fadeOutAnimation,
            child: SlideTransition(
              textDirection: textDirection ?? TextDirection.rtl,
              position: slideAnimation,
              child: child!,
            ),
          );
        },
        child: child,
      );
    },
  );
}
