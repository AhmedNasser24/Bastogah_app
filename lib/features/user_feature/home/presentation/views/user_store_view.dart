import 'package:bastogah_app/core/widgets/back_arrow_button.dart';
import 'package:bastogah_app/core/widgets/cart_icon_button.dart';
import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/notification_icon_button.dart';
import '../../../favourites/presentation/widgets/user_store_item.dart';

class UserStoreView extends StatelessWidget {
  const UserStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context, title: "مطاعم"),
        const CustomSearchField(),
        const Gap(12),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              maxCrossAxisExtent: 600,
              mainAxisExtent: 290,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const UserStoreItem();
            },
          ),
        ),
      ],
    );
  }

  Widget appBar(BuildContext context, {required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        width: double.infinity,
        child: Row(
          children: [
            const BackArrowButton(),
            const Gap(10),
            Text(
              title,
              style: AppFontStyle.semibold20black1A(context),
              overflow: TextOverflow.fade,
            ),
            const Spacer(),
            const CartIconButton(),
            const Gap(8),
            const NotificationIconButton(isThereNewNotification: true),
          ],
        ),
      ),
    );
  }
}
