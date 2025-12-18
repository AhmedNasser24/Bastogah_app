import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.maxLines = 1,
    this.hintStyle,
    this.textStyle,
    this.filled = false,
    this.fillColor = AppColors.white,
    this.borderSide,
    this.autovalidateMode,
    this.inputFormatters,
    this.title,
    this.borderWidth,
    this.enableBorderColor = AppColors.lightGrey,
    this.focusBorderColor = AppColors.primary,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon, prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  final int? maxLines;
  final TextStyle? textStyle, hintStyle;
  final Color? fillColor;
  final bool filled;
  final double? borderSide;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final String? title;
  final double? borderWidth;
  final Color enableBorderColor;
  final Color focusBorderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...{
          Text(title!, style: AppFontStyle.semibold14black4B(context)),
          const Gap(6),
        },
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          obscuringCharacter: '.',
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          onTap: onTap,
          readOnly: readOnly,
          maxLines: maxLines,
          style: AppFontStyle.regular16black1A(context),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),

            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: suffixIcon,
            ),
            fillColor: fillColor,
            filled: filled,
            hintText: hintText,
            hintStyle: hintStyle ?? AppFontStyle.regular16grey(context),
            enabledBorder: enableOutlineInputBorder(),
            focusedBorder: focusOutlineInputBorder(),
            border: enableOutlineInputBorder(),
            errorBorder: errorOutlineInputBorder(),
            disabledBorder: enableOutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder enableOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: borderWidth ?? 1, color: enableBorderColor),
    );
  }

  OutlineInputBorder focusOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: borderWidth ?? 1, color: focusBorderColor),
    );
  }

  OutlineInputBorder errorOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: AppColors.red),
    );
  }
}
