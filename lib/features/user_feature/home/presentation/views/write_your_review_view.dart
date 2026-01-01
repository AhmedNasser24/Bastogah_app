import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/custom_rating_bar.dart';

class WriteYourReviewView extends StatefulWidget {
  const WriteYourReviewView({super.key});

  @override
  State<WriteYourReviewView> createState() => _WriteYourReviewViewState();
}

class _WriteYourReviewViewState extends State<WriteYourReviewView> {
  double rating = 0.0;
  bool isButtonEnabled() {
    return rating > 0.0 && controller.text.isNotEmpty;
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 30,
                    children: [
                      const Gap(20),
                      CustomRatingBar(
                        onRatingUpdate: (rating) {
                          this.rating = rating;
                          setState(() {});
                        },
                      ),
                      CustomTextFormField(
                        controller: controller,
                        maxLines: 5,
                        hintText: "user.write_your_review_hint".tr(),
                        hintStyle: AppFontStyle.regular14grey(context),
                        title: "user.write_your_review".tr(),
                        titleStyle: AppFontStyle.bold16Black1A(context),
                        onChanged: (value) {
                          setState(() {}); // To update the button state
                        },
                      ),

                      CustomButton(
                        onTap: () {},
                        title: "user.submit".tr(),
                        color: isButtonEnabled()
                            ? AppColors.primary
                            : AppColors.lightGrey,
                        textStyle: isButtonEnabled()
                            ? AppFontStyle.bold16White(context)
                            : AppFontStyle.bold16Grey(context),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 60,
        child: Center(
          child: Row(
            children: [
              const BackArrowButton(),
              const Gap(8),
              Text(
                "user.write_your_review".tr(),
                style: AppFontStyle.bold16Black1A(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
