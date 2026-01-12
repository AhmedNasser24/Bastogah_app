import 'package:bastogah_app/core/models/bottom_bar_model.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';
import '../../../../../core/theme/app_font_style.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  bool isSelected(int index) {
    String currentPath = GoRouterState.of(context).uri.path;
    if (index == 0) {
      return currentPath == userBottomBarItems[index].routeName ||
          currentPath ==
              RouteName.userMerchants; // user merchant is inside home
    }
    return currentPath == userBottomBarItems[index].routeName;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        children: [
          for (int i = 0; i < userBottomBarItems.length; i++)
            Expanded(
              child: InkWell(
                onTap: () {
                  context.go(userBottomBarItems[i].routeName);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected(i)
                        ? AppColors.secondary
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          isSelected(i)
                              ? userBottomBarItems[i].activeIcon
                              : userBottomBarItems[i].inactiveIcon,
                        ),

                        const Gap(4),
                        Text(
                          userBottomBarItems[i].title.tr(),
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
