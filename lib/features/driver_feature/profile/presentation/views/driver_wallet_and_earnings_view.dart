import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/driver_dues_section.dart';
import '../widgets/driver_last_progress_section.dart';

class DriverWalletAndEarningsView extends StatelessWidget {
  const DriverWalletAndEarningsView({super.key});

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
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),

                  slivers: [
                    const SliverGap(10),
                    const SliverToBoxAdapter(child: DuesSection()),
                    const SliverGap(24),
                    SliverToBoxAdapter(
                      child: Text(
                        "driver.last_process".tr(),
                        style: AppFontStyle.bold16Black4B(context),
                      ),
                    ),
                    const DriverLastProgressSection(),
                  ],
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
              "driver.dues".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
