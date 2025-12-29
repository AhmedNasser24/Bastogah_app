import 'dart:developer';

import 'package:bastogah_app/core/enums/roles_enum.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';

class RoleView extends StatefulWidget {
  const RoleView({super.key});

  @override
  State<RoleView> createState() => _RoleViewState();
}

class _RoleViewState extends State<RoleView> {
  int selectedIndex = 0;
  late List<RolesEnum> roles;
  @override
  void initState() {
    super.initState();
    roles = RolesEnum.values;
  }

  @override
  Widget build(BuildContext context) {
    log('roles: $roles');
    log('roles[0].title: ${roles[0].title}');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(20),
                  Image.asset(AppImages.imagesLogoOrange),
                  const Gap(10),

                  Text(
                    "select_role".tr(),
                    style: AppFontStyle.semibold20black1A(context),
                  ),
                  const Gap(30),
                  for (int i = 0; i < 3; i++) ...[
                    const Gap(16),
                    CustomButton(
                      // title: " roles[0].title.tr()",
                      title: roles[i].title.tr(),
                      color: i == selectedIndex
                          ? AppColors.primary
                          : AppColors.lightGrey,
                      textStyle: i == selectedIndex
                          ? null
                          : AppFontStyle.semibold16black1A(context),
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                    ),
                  ],
                  const Gap(60),
                  CustomButton(
                    width: 140,
                    title: "confirm".tr(),
                    color: AppColors.primary,
                    onTap: () {
                      context.push(roles[selectedIndex].routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
