import 'package:bastogah_app/core/enums/merchant_filter_enums.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/models/merchant_filter_model.dart';
import '../../manager/merchant_get_orders_cubit/merchant_get_orders_cubit.dart';

class MerchantFiltersHome extends StatefulWidget {
  const MerchantFiltersHome({super.key});

  @override
  State<MerchantFiltersHome> createState() => _MerchantFiltersHomeState();
}

class _MerchantFiltersHomeState extends State<MerchantFiltersHome> {
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
                  merchantOrderFilters.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      BlocProvider.of<MerchantGetOrdersCubit>(
                        context,
                      ).fetchOrders(
                        status: merchantOrderFilters[index].filter.status,
                      );
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
                          merchantOrderFilters[index].title,
                          style: isSelected(index)
                              ? AppFontStyle.bold14Primary(context)
                              : merchantOrderFilters[index].filter ==
                                    MerchantFilterEnum.cancelled
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
    switch (merchantOrderFilters[selectedIndex].filter) {
      case MerchantFilterEnum.pending:
        return "merchant.filter.new_orders".tr();
      case MerchantFilterEnum.waitingDriver:
        return "merchant.filter.waiting_for_driver".tr();
      case MerchantFilterEnum.inprogress:
        return "merchant.filter.in_progress_orders".tr();
      case MerchantFilterEnum.completed:
        return "merchant.filter.completed_orders".tr();
      case MerchantFilterEnum.cancelled:
        return "merchant.filter.cancelled_orders".tr();
    }
  }
}
