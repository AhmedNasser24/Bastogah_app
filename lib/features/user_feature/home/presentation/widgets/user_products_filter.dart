import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';

class UserProductFilter extends StatefulWidget {
  const UserProductFilter({super.key});

  @override
  State<UserProductFilter> createState() => _UserProductFilterState();
}

class _UserProductFilterState extends State<UserProductFilter> {
  int selectedIndex = 0;
  bool isSelected(int index) {
    return selectedIndex == index;
  }

  List<String> productFilters = [
    "الاكثر مبيعاً",
    "الاعلى تقييماً",
    "الساندوتش",
    "المشروبات",
    "الحلويات",
    "الوجبات الرئيسية",
    "الاضافات",
    "المقبلات",
    "السلطات",
    "الشوربات",
  ];
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
                  productFilters.length,
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
                            width: 2,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          productFilters[index],
                          style: isSelected(index)
                              ? AppFontStyle.bold14Primary(context)
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            productFilters[selectedIndex],
            style: AppFontStyle.bold18Black1A(context),
          ),
        ),
      ],
    );
  }
}
