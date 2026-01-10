import 'package:bastogah_app/core/widgets/custom_toast/show_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/launcher/my_url_launcher.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/theme/app_images.dart';

class ShowLocationMapImage extends StatelessWidget {
  const ShowLocationMapImage({super.key, required this.lat, required this.lng});
  final double? lat, lng;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImages.imagesMap, fit: BoxFit.cover),
          InkWell(
            onTap: () {
              if (lat == null || lng == null) {
                CustomFlutterToast.showErrorToast(
                  "merchant.client_has_no_location".tr(),
                );
                return;
              }
              MyUrlLauncher().openGoogleMaps(lat: lat!, lng: lng!);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "merchant.show_location".tr(),
                style: AppFontStyle.medium14Primary(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
