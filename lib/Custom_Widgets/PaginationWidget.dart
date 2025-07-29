import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';

class Paginationwidget extends StatefulWidget {
  const Paginationwidget({super.key});

  @override
  State<Paginationwidget> createState() => _PaginationwidgetState();
}

class _PaginationwidgetState extends State<Paginationwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomContainer(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.blackColor,
            ),
          ),
          CustomContainer(
            child: Text("1", style: Theme.of(context).textTheme.titleLarge),
          ),
          CustomContainer(
            child: Text("2", style: Theme.of(context).textTheme.titleLarge),
          ),
          CustomContainer(
            child: Text("3", style: Theme.of(context).textTheme.titleLarge),
          ),
          CustomContainer(
            child: Text("4", style: Theme.of(context).textTheme.titleLarge),
          ),
          CustomContainer(
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.tinyX,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.lightPurpleColor,
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(color: AppColors.greyColor),
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
