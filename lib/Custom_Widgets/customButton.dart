import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';
import 'package:flutter_widgets/app_setup/utils/loader.dart';

class HeaderTag extends StatelessWidget {
  const HeaderTag({
    super.key,
    required this.backgroundColor,
    required this.text,
  });
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
            color: AppColors.textWhiteColor,
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class Custombutton extends StatefulWidget {
  Custombutton({
    super.key,
    this.fieldCheck = false,
    required this.width,
    required this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    required this.text,
    this.textSize,
    this.textColor,
    required this.onTap,
    this.gradientColor,
    this.iconAsset,
    this.isLoading = false,
  });
  bool fieldCheck;

  final VoidCallback onTap;
  final double width;
  final double height;
  double? borderRadius = 0;
  final String text;
  double? textSize;
  LinearGradient? gradientColor;
  Color? textColor;
  Color? backgroundColor = AppColors.textWhiteColor;
  Color? borderColor = AppColors.textWhiteColor;
  String? iconAsset;
  final bool isLoading;

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  invertColors() {
    setState(() {
      if (widget.textColor == AppColors.primaryColor &&
          widget.backgroundColor == AppColors.greyColor) {
        widget.textColor = AppColors.textWhiteColor;
        widget.backgroundColor = AppColors.primaryColor;
      } else {
        widget.textColor = AppColors.primaryColor;
        widget.backgroundColor = AppColors.greyColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fieldCheck) {
      invertColors();
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        // padding: EdgeInsets.symmetric(vertical: widget.paddingVert ?? 0),
        decoration: BoxDecoration(
          color: widget.gradientColor == null ? widget.backgroundColor : null,
          gradient: widget.gradientColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 54),
          border: Border.all(
            color: widget.gradientColor != null
                ? Colors.transparent
                : widget.borderColor ??
                      widget.backgroundColor ??
                      AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        child: widget.isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: const ButtonLoader(),
              )
            : widget.iconAsset == null
            ? Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: widget.textSize ?? 16.sp,
                    fontWeight: FontWeight.w700,
                    color: widget.textColor ?? AppColors.textWhiteColor,
                    fontFamily: "Poppins",
                  ),
                ),
              )
            : SizedBox(
                width: widget.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      widget.iconAsset!,
                      width: 40.w,
                      height: 40.h,
                      colorFilter: ColorFilter.mode(
                        AppColors.textWhiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    AppSizes.smallX,
                    Flexible(
                      child: Text(
                        widget.text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: widget.textSize ?? 16.sp,
                          fontWeight: FontWeight.w700,
                          color: widget.textColor ?? AppColors.textWhiteColor,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
