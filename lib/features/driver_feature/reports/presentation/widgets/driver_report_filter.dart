import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';

class DriverReportFilter extends StatefulWidget {
  const DriverReportFilter({super.key});

  @override
  State<DriverReportFilter> createState() => _DriverReportFilterState();
}

class _DriverReportFilterState extends State<DriverReportFilter> {
  List<String> filters = ["week".tr(), "month".tr(), "year".tr()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: filters.asMap().entries.map((entry) {
        int idx = entry.key;
        String filter = entry.value;
        bool isSelected = idx == selectedIndex;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = idx;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.secondary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  filter,
                  style: isSelected
                      ? AppFontStyle.bold14White(context)
                      : AppFontStyle.bold14Primary(context),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
