import 'dart:developer' as dev;
import 'dart:math';

import 'package:bastogah_app/core/models/region_model.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../get_city_region/presentation/manager/city_region_cubit/city_region_cubit.dart';

class RegisterRegionField extends StatefulWidget {
  const RegisterRegionField({super.key});
  @override
  State<RegisterRegionField> createState() => _RegisterRegionFieldState();
}

class _RegisterRegionFieldState extends State<RegisterRegionField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  List<RegionModel> regions = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CityRegionCubit, CityRegionState>(
      listener: (context, state) {
        if (state is FetchRegionsSuccess) {
          regions = state.regions;
        }
      },
      child: CustomButtonToShowOverlayDialog(
        showDialog: showDialog,
        buttonKey: _buttonKey,
        vertical: 55,
        widgetListInDialog: regions.isNotEmpty
            ? regions
                  .map(
                    (region) => InkWell(
                      onTap: () async {
                        setState(() {
                          showDialog = false;
                        });
                        controller.text = region.name;
                        BlocProvider.of<CityRegionCubit>(
                          context,
                        ).fetchCities(regionId: region.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Text(
                              region.name,
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
                          "no_region_found".tr(),
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
          hintText: 'merchant.select_governorate'.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.iconsAuthPin20Grey),
          ),
          suffixIcon: Transform.rotate(
            angle: pi / 2,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
