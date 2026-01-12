import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/local_storage_data/local_storage_data.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/logout_button.dart';
import '../../data/model/profile_model.dart';
import '../widgets/user_profile_info_section.dart' show UserProfileInfoSection;

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  late ProfileModel profileModel;
  late ProfileCubit profileCubit;
  @override
  void initState() {
    super.initState();
    profileCubit = getIt<ProfileCubit>();
    profileCubit.getProfile();
    profileModel = LocalStorageData.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileCubit,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          children: [
            const Gap(20),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileFailure) {
                  CustomToastification.showFailureToast(
                    message: state.errMessage,
                  );
                } else if (state is ProfileSuccess) {
                  profileModel = state.profile;
                }
              },
              builder: (context, state) {
                switch (state) {
                  case ProfileInitial():
                  case ProfileLoading():
                  case ProfileFailure():
                    return CustomSkeletonizer(
                      child: UserProfileInfoSection(profileModel: profileModel),
                    );
                  case ProfileSuccess():
                    return UserProfileInfoSection(profileModel: state.profile);
                }
              },
            ),
            const Gap(20),
            profileTile(
              context,
              imagePath: AppIcons.iconsPersonProfileIcon,
              title: "merchant.profile.profile_info".tr(),
              onTap: () {
                context.push(RouteName.userEditProfile, extra: profileModel);
              },
            ),
            profileTile(
              context,
              imagePath: AppIcons.iconsPin24Icon,
              title: "user.saved_addresses".tr(),
              onTap: () {
                context.push(RouteName.userSavedAddresses);
              },
            ),
            profileTile(
              context,
              imagePath: AppIcons.iconsNotificationProfileIcon,
              title: "merchant.profile.notification".tr(),
              onTap: () {
                context.push(RouteName.notification);
              },
            ),
            profileTile(
              context,
              imagePath: AppIcons.iconsProfileRating,
              title: "user.ratings".tr(),
              onTap: () {
                context.push(RouteName.userMyRating);
              },
            ),
            profileTile(
              context,
              imagePath: AppIcons.iconsProfileCoupons,
              title: "user.coupons".tr(),
              onTap: () {
                context.push(RouteName.userCoupons);
              },
            ),
            profileTile(
              context,
              imagePath: AppIcons.iconsPrivacyProfileIcon,
              title: "merchant.profile.privacy".tr(),
              onTap: () {
                context.push(RouteName.privacy);
              },
            ),
            profileTile(
              context,
              imagePath: AppIcons.iconsQuestionProfileIcon,
              title: "merchant.profile.help_support".tr(),
              onTap: () {
                context.push(RouteName.helpSupport);
              },
            ),
            const Gap(20),
            const LogoutButton(),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  GestureDetector profileTile(
    BuildContext context, {
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        color: AppColors.white,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,

                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                const Gap(8),
                Text(title, style: AppFontStyle.regular14black1A(context)),
                const Spacer(),
                SvgPicture.asset(AppIcons.iconsForwardIcon, fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
