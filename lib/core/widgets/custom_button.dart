import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.textStyle,
    this.onTap,
    this.width,
    this.borderRadius = 16.0,
    this.color = AppColors.primary,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxWidth = 400,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.borderWidth = 1,
  });
  final String? title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? width;
  final double borderRadius;
  final Color color;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double maxWidth;
  final bool isLoading;
  final EdgeInsetsGeometry padding;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          width: width,
          constraints: BoxConstraints(maxWidth: maxWidth),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth)
                : null,
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6,
                    children: [
                      if (prefixIcon != null) ...[prefixIcon!],
                      Text(
                        title!,
                        style: textStyle ?? AppFontStyle.bold16White(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (suffixIcon != null) ...[suffixIcon!],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
