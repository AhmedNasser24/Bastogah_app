import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';

class DetectItemQuantity extends StatefulWidget {
  const DetectItemQuantity({super.key});

  @override
  State<DetectItemQuantity> createState() => _DetectItemQuantityState();
}

class _DetectItemQuantityState extends State<DetectItemQuantity> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (quantity > 1) {
                quantity--;
              }
            });
          },

          icon: const Icon(Icons.remove, size: 18, color: AppColors.black1A),
        ),

        Text(
          "$quantity", // This should be the current quantity
          style: AppFontStyle.semibold14black1A(context),
        ),

        IconButton(
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
          icon: const Icon(Icons.add, size: 18, color: AppColors.black1A),
        ),
      ],
    );
  }
}
