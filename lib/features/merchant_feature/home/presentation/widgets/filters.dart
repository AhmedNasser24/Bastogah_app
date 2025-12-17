import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/merchant_filter_model.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int selectedIndex = 0;
  bool isSelcted(int index) {
    return selectedIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    color: isSelcted(index)
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 4,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  merchantFilters[index].title,
                  style: isSelcted(index)
                      ? AppFontStyle.bold14Primary(context)
                      : AppFontStyle.semibold14grey(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
