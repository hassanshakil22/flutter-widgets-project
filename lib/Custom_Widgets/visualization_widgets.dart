import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/core/extensions/sizes_extensions.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.height,
    this.centerSpaceRadius,
    required this.sections,
    required this.titles,
    required this.values,
    required this.colors,
  });
  final double height;
  final double? centerSpaceRadius;
  final int sections;
  final List<String> titles; // should be Same length same as sections
  final List<double> values; // should be Same length same as sections
  final List<Color> colors; // should be Same length same as sections

  @override
  Widget build(BuildContext context) {
    final providerIndex = -1;
    //  context.watch<HomeProvider>().touchedIndex;
    return SizedBox(
      height: height,
      width: context.wid,
      child: PieChart(
        PieChartData(
          centerSpaceRadius:
              centerSpaceRadius, // this fills the center of pieChart
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse?.touchedSection == null) {
                updateIndex(
                  context: context,
                  index: -1,
                ); // or any other method you made to update the index in state management
                return;
              }
              final index =
                  pieTouchResponse!.touchedSection!.touchedSectionIndex;
              updateIndex(context: context, index: index); // check this !!
            }, // checks the section  you have touched and gives it index that you can further give to you function to update the index
          ),
          sections: List.generate(sections, (index) {
            // first index for Expenses second for revenue
            final isTouched = index == providerIndex;
            final double radius = isTouched ? 120 : 100;

            return PieChartSectionData(
              badgeWidget: isTouched
                  ? Transform.translate(
                      offset: Offset(10.w, -40.h),
                      child: Container(
                        padding: AppPaddings.small,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.info, color: AppColors.blackColor),
                            AppSizes.tinyX,
                            Text(
                              "YOUR ${titles[index]} FOR THE MONTH OF ${DateFormat.MMMM().format(DateTime.now()).toUpperCase()}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
              value: values[index],
              title: isTouched
                  ? "${titles[index]} ${values[index].toInt()}%"
                  : titles[index],
              color: colors[index],
              radius: radius,
              titleStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }),
        ),
      ),
    );
  }
}

void updateIndex({required BuildContext context, required int index}) {
  // context.read<HomeProvider>().updateIndex(index);
}
