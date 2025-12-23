import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';

class MerchantFiltersForProducts extends StatefulWidget {
  const MerchantFiltersForProducts({super.key});

  @override
  State<MerchantFiltersForProducts> createState() =>
      _MerchantFiltersForProductsState();
}

class _MerchantFiltersForProductsState
    extends State<MerchantFiltersForProducts> {
  int selectedIndex = 0;
  bool isSelected(int index) {
    return selectedIndex == index;
  }

  List<String> merchantProductFilters = [
    "الكل",
    "الاكثر مبيعا",
    "الساندوتسش",
    "البرغر",
    "المشروبات",
    "الحلويات",
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              merchantProductFilters.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: isSelected(index)
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.lightGrey,
                      width: isSelected(index) ? 1 : 0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      merchantProductFilters[index],
                      style: isSelected(index)
                          ? AppFontStyle.regular12White(context)
                          : AppFontStyle.regular12black4B(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
