import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.textStyle,
    this.onTap,
    this.width,
    this.borderRadius,
    this.color = AppColors.primary,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxWidth = 400,
    this.isLoading = false,
  });
  final String? title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? width;
  final double? borderRadius;
  final Color color;
  final Color? borderColor;
  final String? prefixIcon;
  final String? suffixIcon;
  final double maxWidth;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(
          borderRadius != null ? borderRadius! : 16.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: width,
          constraints: BoxConstraints(maxWidth: maxWidth),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 1)
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
                      if (prefixIcon != null) ...[
                        SvgPicture.asset(prefixIcon!),
                      ],
                      Text(
                        title!,
                        style: textStyle ?? AppFontStyle.bold16White(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (suffixIcon != null) ...[
                        SvgPicture.asset(suffixIcon!),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
