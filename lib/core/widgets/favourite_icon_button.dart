import 'package:flutter/material.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    this.radius = 17.5,
    required this.activeIcon,
    required this.inactiveIcon,
    this.backgroundColor,
    this.onTap,
  });
  final double radius;
  final Widget activeIcon, inactiveIcon;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        setState(() {
          isFavourite = !isFavourite;
        });
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
