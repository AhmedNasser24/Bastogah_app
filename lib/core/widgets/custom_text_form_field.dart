
import 'package:chef_app/core/utils/themes/app_colors.dart';
import 'package:chef_app/core/utils/themes/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

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
    this.filled,
    this.fillColor,
    this.borderSide,
    this.autovalidateMode,
    this.inputFormatters,
    this.title,
    this.borderWidth,
    this.borderColor,
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
  final bool? filled;
  final double? borderSide;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final String? title;
  final double? borderWidth ;
  final Color? borderColor ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...{
          Text(title!, style: AppFontStyle.regular16WhiteE7),
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
          style: AppFontStyle.regular14White,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),

            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: suffixIcon,
            ),
            fillColor: fillColor ?? AppColors.black11,
            filled: true,
            hintText: hintText,
            hintStyle: AppFontStyle.regular14WhiteFA,
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
      borderRadius: BorderRadius.circular(8.0),
      borderSide:  BorderSide(width: borderWidth ?? 1, color: borderColor ?? AppColors.black11),
    );
  }

  OutlineInputBorder focusOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide:  BorderSide(width: borderWidth ?? 1, color: borderColor ?? AppColors.black11),
    );
  }
  OutlineInputBorder errorOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide:  BorderSide(width: 1,  color:  Colors.red),
    );
  }
}
