import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:chef_app/core/utils/themes/app_colors.dart';
import 'package:chef_app/core/utils/themes/app_font_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.textStyle,
    this.onTap,
    this.width,
    this.borderRadius,
    this.color,
    this.borderColor,
  });
  final String? title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(
        borderRadius != null ? borderRadius! : 16.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: width,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1)
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: textStyle ?? AppFontStyle.bold16White,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
