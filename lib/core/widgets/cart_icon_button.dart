import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../local_storage_data/local_storage_data.dart';
import '../theme/app_icons.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.cart);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(child: SvgPicture.asset(AppIcons.iconsUserCart)),
          ),
          ValueListenableBuilder(
            valueListenable: LocalStorageData.cartsNotifier,
            builder: (context, carts, child) {
              return Positioned(
                right: -6,
                top: -6,
                child: Container(
                  height: 20,
                  width: 20,
                  padding: const EdgeInsets.all(3.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        carts
                            .fold(
                              0,
                              (previousValue, cart) =>
                                  previousValue + cart.quantity,
                            )
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
