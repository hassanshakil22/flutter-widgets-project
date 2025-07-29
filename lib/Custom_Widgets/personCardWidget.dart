import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/Custom_Widgets/avatarContainer.dart';
import 'package:flutter_widgets/app_setup/core/extensions/sizes_extensions.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';

class PersonCardWidget extends StatelessWidget {
  const PersonCardWidget({
    super.key,
    required this.name,
    required this.number,
    required this.relation,
    required this.asset,
  });
  final String name;
  final String number;
  final String relation;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: context.wid,
      margin: AppPaddings.tinyY,
      padding: AppPaddings.tiny,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,

            blurRadius: 7.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: Avatarcontainer(
              height: 56.h,
              width: 56.w,
              shadowColor: Color.fromRGBO(255, 255, 255, 0.5),
              color: Color.fromRGBO(255, 255, 255, 0.5),
              asset: asset,
            ),
          ),

          AppSizes.normalX,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              Text(number, style: Theme.of(context).textTheme.titleMedium),
              Text(relation, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.blackColor),
        ],
      ),
    );
  }
}
