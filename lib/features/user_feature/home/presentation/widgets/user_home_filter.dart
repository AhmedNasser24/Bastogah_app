import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_icons.dart';

class UserHomeFilter extends StatefulWidget {
  const UserHomeFilter({super.key});

  @override
  State<UserHomeFilter> createState() => _UserHomeFilterState();
}

class _UserHomeFilterState extends State<UserHomeFilter> {
  int selectedIndex = 0;
  bool isSelected(int index) {
    return selectedIndex == index;
  }

  List<Map<String, String>> homeFilters = [
    {"title": "الاكثر مبيعاً", "icon": AppIcons.iconsStar},
    {"title": "الاكثر مبيعاً", "icon": AppIcons.iconsStar},
    {"title": "الاكثر مبيعاً", "icon": AppIcons.iconsStar},
    {"title": "الاكثر مبيعاً", "icon": AppIcons.iconsStar},
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
                  homeFilters.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected(index)
                            ? AppColors.secondary
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected(index)
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(homeFilters[index]["icon"]!),
                          const Gap(8),
                          Text(
                            homeFilters[index]["title"]!,
                            style: isSelected(index)
                                ? AppFontStyle.bold14Primary(context)
                                : AppFontStyle.semibold14grey(context),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
            homeFilters[selectedIndex]["title"]!,
            style: AppFontStyle.bold18Black1A(context),
          ),
        ),
      ],
    );
  }
}
