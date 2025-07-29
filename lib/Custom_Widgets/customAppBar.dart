import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/core/extensions/routes_extenstion.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.title, this.color, this.actions, this.bottom, this.onPressed});

  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return AppBar(
      bottom: bottom,
      backgroundColor: color ?? Colors.white,
      title:
          title != null
              ? Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textBlackColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
              : null,
      leading: IconButton(
        onPressed: onPressed ?? () => context.pop(),
        icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
      ),
      actions: actions,
    );
  }
}
