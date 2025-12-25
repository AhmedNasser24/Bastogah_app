import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';

class DriverReportBarChart extends StatefulWidget {
  const DriverReportBarChart({super.key});

  @override
  State<DriverReportBarChart> createState() => _DriverReportBarChartState();
}

class _DriverReportBarChartState extends State<DriverReportBarChart> {
  late List<String> daysOfWeek;
  late List<double> dataOfDays;
  late double maxValue;
  @override
  void initState() {
    super.initState();
    daysOfWeek = [
      "الجمعة",
      "السبت",
      "الأحد",
      "الإثنين",
      "الثلاثاء",
      "الأربعاء",
      "الخميس",
    ];
    daysOfWeek = daysOfWeek.reversed
        .toList(); // to draw chart from right to left
    dataOfDays = [5, 7, 4.5, 8, 6, 3.2, 7];
    dataOfDays = dataOfDays.reversed
        .toList(); // to draw chart from right to left
    maxValue = dataOfDays.isEmpty
        ? 0
        : dataOfDays.reduce((a, b) => a > b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = List.generate(daysOfWeek.length, (
      index,
    ) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: dataOfDays[index],
            color: maxValue == dataOfDays[index]
                ? AppColors.primary
                : AppColors.secondary,
            width: context.isMobile ? 30 : 35,
            borderRadius: BorderRadius.circular(6),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 10,
              color: AppColors.whiteF5,
            ),
          ),
        ],
        showingTooltipIndicators: [0],
      );
    });
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      height: 200,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BarChart(
          BarChartData(
            minY: 0,
            maxY: 10,
            barGroups: barGroups,
            barTouchData: BarTouchData(
              enabled: false,

              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (group) => Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: 0,
                direction: TooltipDirection.top,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${rod.toY}k',
                    AppFontStyle.medium14black4B(context),
                  );
                },
              ),
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    if (index < 0 || index >= daysOfWeek.length) {
                      return const SizedBox.shrink();
                    }
                    return Text(
                      daysOfWeek[index],
                      style: AppFontStyle.regular12grey(context),
                    );
                  },
                ),
              ),
            ),
            // barTouchData: const BarTouchData(enabled: false),
          ),
        ),
      ),
    );
  }
}
