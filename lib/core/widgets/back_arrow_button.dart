import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
        child: Center(child: SvgPicture.asset(AppIcons.iconsBackArrowIcon)),
      ),
    );
  }
}
