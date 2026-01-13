import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_icons.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.cart);
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Center(child: SvgPicture.asset(AppIcons.iconsUserCart)),
      ),
    );
  }
}
