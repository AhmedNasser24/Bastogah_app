import 'package:flutter/material.dart';

import '../../../../../core/theme/app_images.dart';

class MerchantProductImage extends StatelessWidget {
  const MerchantProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 190),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: AssetImage(AppImages.imagesBurger),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
