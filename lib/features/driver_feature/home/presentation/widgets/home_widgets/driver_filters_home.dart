import 'package:bastogah_app/core/enums/driver_filter_enum.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DriverFiltersHome extends StatefulWidget {
  const DriverFiltersHome({super.key});

  @override
  State<DriverFiltersHome> createState() => _DriverFiltersHomeState();
}

class _DriverFiltersHomeState extends State<DriverFiltersHome> {
  int selectedIndex = 0;
  bool isSelected(int index) {
    return selectedIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 40,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  driverOrderFilters.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected(index)
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          driverOrderFilters[index].title.tr(),
                          style: isSelected(index)
                              ? AppFontStyle.bold14Primary(context)
                              : driverOrderFilters[index] ==
                                    DriverFilterEnum.cancelled
                              ? AppFontStyle.semibold14red(context)
                              : AppFontStyle.semibold14grey(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(getCurrentFilter(), style: AppFontStyle.bold18Black1A(context)),
      ],
    );
  }

  String getCurrentFilter() {
    switch (driverOrderFilters[selectedIndex]) {
      case DriverFilterEnum.pending:
        return "merchant.filter.pending".tr();
      case DriverFilterEnum.inDelivery:
        return "merchant.filter.waiting_for_delivery".tr();

      case DriverFilterEnum.completed:
        return "merchant.filter.completed_orders".tr();
      case DriverFilterEnum.cancelled:
        return "merchant.filter.cancelled_orders".tr();
    }
  }
}
