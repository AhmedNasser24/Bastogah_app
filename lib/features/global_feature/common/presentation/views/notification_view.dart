import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../../../../../core/widgets/notification_item.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  final String title = "طلب جديد متاح";
  final String subtitle =
      "لقد تم طلب شاورما دبل لحم مع بطاطا مقلية من قبل العميل محمد احمد في منطقتك";
  final bool isNew = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              appBar(context),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: NotificationItem(
                      title: title,
                      subtitle: subtitle,
                      isNew: index < 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Row(
          children: [
            const BackArrowButton(),
            const Gap(8),
            Text(
              "merchant.profile.notification".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
