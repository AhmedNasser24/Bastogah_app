import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_font_style.dart';

class ResentOtpButton extends StatefulWidget {
  const ResentOtpButton({super.key});

  @override
  State<ResentOtpButton> createState() => _ResentOtpButtonState();
}

class _ResentOtpButtonState extends State<ResentOtpButton> {
  Timer? timer;
  late Duration duration;
  late int start;

  void startTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    start = 30;
    duration = Duration(seconds: start, minutes: 0);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        setState(() {
          start--;
          duration = Duration(seconds: start);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "auth.do_not_receive_otp".tr(),
          style: AppFontStyle.regular14grey(context),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: const EdgeInsets.all(4)),
          onPressed: () {
            startTimer();
          },
          child: Text(
            "auth.resend_otp".tr(
              namedArgs: {
                'seconds':
                    '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
              },
            ),
            style: AppFontStyle.regular14black1A(context),
          ),
        ),
      ],
    );
  }
}
