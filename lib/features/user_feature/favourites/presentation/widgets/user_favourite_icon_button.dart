import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_icons.dart';

class UserFavouriteIconButton extends StatefulWidget {
  const UserFavouriteIconButton({super.key});

  @override
  State<UserFavouriteIconButton> createState() =>
      _UserFavouriteIconButtonState();
}

class _UserFavouriteIconButtonState extends State<UserFavouriteIconButton> {
  bool isFavourite = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
      icon: isFavourite
          ? SvgPicture.asset(AppIcons.iconsActiveUserFavourite)
          : SvgPicture.asset(AppIcons.iconsFavourite24White),
    );
  }
}
