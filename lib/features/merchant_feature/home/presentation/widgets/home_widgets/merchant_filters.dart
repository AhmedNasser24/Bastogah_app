import 'package:bastogah_app/core/enums/merchant_filter_enums.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/models/merchant_filter_model.dart';

class MerchantFilters extends StatefulWidget {
  const MerchantFilters({super.key});

  @override
  State<MerchantFilters> createState() => _MerchantFiltersState();
}

class _MerchantFiltersState extends State<MerchantFilters> {
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
        Row(
          children: List.generate(
            merchantFilters.length,
            (index) => Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(14),
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
                      merchantFilters[index].title,
                      style: isSelected(index)
                          ? AppFontStyle.bold14Primary(context)
                          : merchantFilters[index].filter ==
                                MerchantFilterEnums.cancelled
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
        Text(getCurrentFilter(), style: AppFontStyle.bold18Black1A(context)),
      ],
    );
  }

  String getCurrentFilter() {
    switch (merchantFilters[selectedIndex].filter) {
      case MerchantFilterEnums.pending:
        return "merchant.filter.new_orders".tr();
      case MerchantFilterEnums.inprogress:
        return "merchant.filter.in_progress_orders".tr();
      case MerchantFilterEnums.completed:
        return "merchant.filter.completed_orders".tr();
      case MerchantFilterEnums.cancelled:
        return "merchant.filter.cancelled_orders".tr();
    }
  }
}
