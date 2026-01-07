import 'package:bastogah_app/features/global_feature/get_city_region/presentation/manager/city_region_cubit/city_region_cubit.dart';
import 'package:bastogah_app/features/merchant_feature/profile/presentation/widgets/cancel_edit_profile_button.dart';
import 'package:bastogah_app/features/merchant_feature/profile/presentation/widgets/save_edit_profile_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/user_profile_city_field.dart';
import '../widgets/user_profile_region_field.dart';
import '../widgets/user_profile_name_field.dart';
import '../widgets/user_profile_phone_field.dart';

class UserEditProfileView extends StatefulWidget {
  const UserEditProfileView({super.key});

  @override
  State<UserEditProfileView> createState() => _UserEditProfileViewState();
}

class _UserEditProfileViewState extends State<UserEditProfileView> {
  late CityRegionCubit cityRegionCubit;
  @override
  void initState() {
    super.initState();
    cityRegionCubit = getIt<CityRegionCubit>();
    cityRegionCubit.fetchRegions();
    // fetch city for user's current region
    // cityRegionCubit.fetchCities(regionId: );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cityRegionCubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                appBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),

                    child: Column(
                      spacing: 12,
                      children: [
                        const Gap(10),
                        logoImage(),
                        Text(
                          "merchant.profile.press_to_change_photo".tr(),
                          style: AppFontStyle.regular14black4B(context),
                        ),
                        const Gap(0),
                        const UserProfileNameField(),
                        const UserProfilePhoneField(),
                        const UserProfileRegionField(),
                        const UserProfileCityField(),
                        const Gap(10),
                        const SaveEditProfileButton(),
                        const CancelEditProfileButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoImage() {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        const CircleAvatar(
          radius: 51.5,
          backgroundColor: AppColors.lightGrey,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.imagesUserProfileImage),
          ),
        ),
        SvgPicture.asset(AppIcons.iconsCameraProfileIcon),
      ],
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
              "merchant.profile.profile_info".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
