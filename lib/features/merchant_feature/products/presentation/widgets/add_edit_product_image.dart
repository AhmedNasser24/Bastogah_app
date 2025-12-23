import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';

class AddEditProductImage extends StatelessWidget {
  const AddEditProductImage({super.key});
  final String? imagePath = null;
  @override
  Widget build(BuildContext context) {
    return imagePath != null
        ? Stack(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 190,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 14,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: SvgPicture.asset(AppIcons.iconsAddImageOrange),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: SvgPicture.asset(AppIcons.iconsEditImage),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: SvgPicture.asset(AppIcons.iconsDeleteImage),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 190,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: SvgPicture.asset(AppIcons.iconsEmptyImage),
                ),
              ),
              Positioned(
                bottom: 14,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(AppIcons.iconsAddImageGrey),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(AppIcons.iconsGallary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
