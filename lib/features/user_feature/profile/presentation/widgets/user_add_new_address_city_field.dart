import 'dart:developer' as dev;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/models/city_model.dart';
import '../../../../global_feature/get_city_region/presentation/manager/city_region_cubit/city_region_cubit.dart';

class UserAddNewAddressCityField extends StatefulWidget {
  const UserAddNewAddressCityField({super.key});

  @override
  State<UserAddNewAddressCityField> createState() =>
      _UserAddNewAddressCityFieldState();
}

class _UserAddNewAddressCityFieldState
    extends State<UserAddNewAddressCityField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  List<CityModel> cities = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CityRegionCubit, CityRegionState>(
      listener: (context, state) {
        if (state is FetchCitiesSuccess) {
          cities = state.cities;
          controller.clear();
        } else if (state is NoInternetConnectionState) {
          cities = [];
          controller.clear();
        }
      },
      child: CustomButtonToShowOverlayDialog(
        showDialog: showDialog,
        buttonKey: _buttonKey,
        vertical: 80,
        widgetListInDialog: cities.isNotEmpty
            ? cities
                  .map(
                    (city) => InkWell(
                      onTap: () {
                        controller.text = city.name;
                        setState(() {
                          showDialog = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Text(
                              city.name,
                              style: AppFontStyle.regular16black1A(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()
            : [
                InkWell(
                  onTap: () {
                    setState(() {
                      showDialog = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Text(
                          "no_city_found".tr(),
                          style: AppFontStyle.regular16black1A(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
        mainWidget: CustomTextFormField(
          key: _buttonKey,
          controller: controller,
          onTap: () {
            setState(() {
              showDialog = true;
            });
            dev.log('showGovernerateDialog: $showDialog');
          },
          readOnly: true,
          title: "merchant.city".tr(),
          // titleStyle: AppFontStyle.regular16grey(context),
          hintText: 'merchant.select_city'.tr(),
          // titlePrefixIcon: SvgPicture.asset(AppIcons.iconsAuthCity20Grey),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
