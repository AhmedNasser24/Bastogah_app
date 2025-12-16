import 'package:bastogah_app/core/models/merchant_bottom_bar_model.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';

class CustomMerchantBottomNavBar extends StatefulWidget {
  const CustomMerchantBottomNavBar({super.key});

  @override
  State<CustomMerchantBottomNavBar> createState() =>
      _CustomMerchantBottomNavBarState();
}

class _CustomMerchantBottomNavBarState
    extends State<CustomMerchantBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          for (int i = 0; i < merchantBottomBarItems.length; i++)
            Expanded(
              child: InkWell(
                onTap: () {
                  context.go(merchantBottomBarItems[i].routeName);
                  setState(() {
                    _currentIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: i == _currentIndex
                        ? AppColors.yellow
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        i == _currentIndex
                            ? SvgPicture.asset(
                                merchantBottomBarItems[i].activeIcon,
                              )
                            : SvgPicture.asset(
                                merchantBottomBarItems[i].inactiveIcon,
                              ),
                        const Gap(4),
                        Text(
                          merchantBottomBarItems[i].title.tr(),
                          style: AppFontStyle.medium10primary(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// class ScaleTransitionAnimation extends StatefulWidget {
//   const ScaleTransitionAnimation({
//     super.key,
//     required this.child,
//     required this.duration,
//     this.isVisible = false,
//   });

//   final Widget child;
//   final Duration duration;
//   final bool isVisible;

//   @override
//   State<ScaleTransitionAnimation> createState() =>
//       _ScaleTransitionAnimationState();
// }

// class _ScaleTransitionAnimationState extends State<ScaleTransitionAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: widget.duration);

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.fastOutSlowIn,
//     );
//     _updateAnimation();
//   }

//   @override
//   void didUpdateWidget(ScaleTransitionAnimation oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _updateAnimation();
//   }

//   void _updateAnimation() {
//     if (widget.isVisible) {
//       _controller.reverse();
//     } else {
//       _controller.forward();
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(scale: _animation, child: widget.child);
//   }
// }
