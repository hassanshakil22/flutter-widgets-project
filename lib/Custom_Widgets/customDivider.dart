import 'package:flutter/material.dart';
import 'package:flutter_widgets/app_setup/core/extensions/sizes_extensions.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wid*0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Divider(color: AppColors.textGreyColor, height: 2),
                ),
                Expanded(flex: 2, child: SizedBox.shrink()),
                Expanded(
                  flex: 2,
                  child: Divider(color: AppColors.textGreyColor, height: 2),
                ),
              ],
            ),
          );
  }
}