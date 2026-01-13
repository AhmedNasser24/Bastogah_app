import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/user_feature/favourites/presentation/manager/favourite_cubit/favourite_cubit.dart';
import '../../features/user_feature/home/data/model/user_merchant_model.dart';
import '../local_storage_data/local_storage_data.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    this.radius = 17.5,
    required this.activeIcon,
    required this.inactiveIcon,
    this.backgroundColor,
    this.onTap,
    this.merchant,
    this.isInFavouriteView = false,
  });
  final double radius;
  final Widget activeIcon, inactiveIcon;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final UserMerchantModel? merchant;
  final bool isInFavouriteView;
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool isFavourite;
  @override
  void initState() {
    super.initState();
    isFavourite = widget.isInFavouriteView;
  }

  @override
  Widget build(BuildContext context) {
    log("isInFavouriteView : ${widget.isInFavouriteView}");
    log("isFavourite : $isFavourite");
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();

        if (widget.merchant != null) {
          if (!isFavourite) {
            LocalStorageData.addFavourite(widget.merchant!);
            setState(() {
              isFavourite = !isFavourite;
            });
          } else {
            if (widget.isInFavouriteView) {
              BlocProvider.of<FavouriteCubit>(
                context,
              ).removeFavourite(widget.merchant!);
            } else {
              LocalStorageData.removeFavouriteItem(widget.merchant!.id!);
              setState(() {
                isFavourite = !isFavourite;
              });
            }
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: CircleAvatar(
          radius: widget.radius,
          backgroundColor: widget.backgroundColor,
          child: Center(
            child: isFavourite ? widget.activeIcon : widget.inactiveIcon,
          ),
        ),
      ),
    );
  }
}
