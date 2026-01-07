import 'dart:developer' as dev;
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/models/region_model.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../global_feature/get_city_region/presentation/manager/city_region_cubit/city_region_cubit.dart';

class MerchantAddNewOrderRegionField extends StatefulWidget {
  const MerchantAddNewOrderRegionField({super.key});

  @override
  State<MerchantAddNewOrderRegionField> createState() =>
      _MerchantAddNewOrderRegionFieldState();
}

class _MerchantAddNewOrderRegionFieldState
    extends State<MerchantAddNewOrderRegionField> {
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
        vertical: 80,
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
            dev.log('showGovernorateDialog: $showDialog');
          },
          title: 'merchant.governorate'.tr(),
          hintText: 'merchant.select_governorate'.tr(),
          readOnly: true,
          suffixIcon: Transform.rotate(
            angle: pi / 2,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
