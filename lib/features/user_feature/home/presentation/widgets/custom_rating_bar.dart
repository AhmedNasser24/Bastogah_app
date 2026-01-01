import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.onRatingUpdate});
  final void Function(double) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      // glowRadius: ,
      ratingWidget: RatingWidget(
        full: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(AppIcons.iconsStar, height: 16, width: 16),
        ),
        half: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(AppIcons.iconsStar, height: 16, width: 16),
        ),
        empty: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(
            AppIcons.iconsStarOutline,
            height: 16,
            width: 16,
          ),
        ),
      ),
      itemCount: 5,

      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      // itemBuilder: (context, _) => Padding(
      //   padding: const EdgeInsets.all(4.0),
      //   child: SvgPicture.asset(AppIcons.iconsStar, height: 20, width: 20),
      // ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
