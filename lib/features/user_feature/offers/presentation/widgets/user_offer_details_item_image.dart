import 'package:flutter/material.dart';

import '../../../../../core/theme/app_images.dart';

class UserOfferDetailsItemImage extends StatelessWidget {
  const UserOfferDetailsItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Image.asset(AppImages.imagesPizzaHut, fit: BoxFit.cover),
      ),
    );
  }
}
