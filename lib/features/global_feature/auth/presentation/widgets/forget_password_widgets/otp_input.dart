import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        inputFormatters: [
          // LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: AppColors.primary,
        style: AppFontStyle.semibold20black1A(context),

        decoration: InputDecoration(
          // fillColor: const Color(0xFFD6E3F0),
          // filled: true,
          counterText: "", // removes length counter
          border: outLineInputBorder(),
          focusedBorder: focusOutlineInputBorder(),
          enabledBorder: outLineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus(); // move forward
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus(); // move backward
          }
        },
      ),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.lightGrey),
    );
  }

  OutlineInputBorder focusOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.primary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildOtpBox(index),
          );
        }),
      ),
    );
  }
}
