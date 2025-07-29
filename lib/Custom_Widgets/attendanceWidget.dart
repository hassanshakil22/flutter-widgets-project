/* README : this is a custom attendance putting widget where you can add multiple attendnaces 

*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';

class AttendanceTable extends StatefulWidget {
  const AttendanceTable({super.key});

  @override
  State<AttendanceTable> createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightPurpleColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: AppPaddings.tiny,
                  child: Text(
                    "MSC.NO",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: AppPaddings.tiny,
                  child: Text(
                    "Guard Name",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: AppPaddings.tiny,
                  child: Text(
                    "Shift",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: AppPaddings.tiny,
                  child: Text(
                    "Attendance",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Table Rows
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: AppPaddings.tiny,
                      child: Text(
                        "MSC.NO",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: AppPaddings.tiny,
                      child: Text(
                        "Guard Name",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: AppPaddings.tiny,
                      child: Text(
                        "Shift",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: AppPaddings.tiny,
                      child: CompactRadioRow(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class CompactRadioRow extends StatefulWidget {
  const CompactRadioRow({super.key});

  @override
  State<CompactRadioRow> createState() => _CompactRadioRowState();
}

class _CompactRadioRowState extends State<CompactRadioRow> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['P', 'A', 'R', 'L'].map((value) {
        return GestureDetector(
          onTap: () => setState(() => _selectedValue = value),
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedValue == value
                    ? AppColors.primaryColor
                    : AppColors.greyColor,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _selectedValue == value
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
