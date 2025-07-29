import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/Custom_Widgets/customButton.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';

class Emptycollectionwidget extends StatelessWidget {
  Emptycollectionwidget({
    super.key,
    this.text,
    this.width,
    this.buttonText,
    this.onTap,
  });
  final String? text;
  final String? buttonText;
  final double? width;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: CircleAvatar(
              backgroundColor: AppColors.backgroundColor,
              child: Padding(
                padding: EdgeInsets.all(20.r), // Responsive padding
                child: Image.asset(
                  "assets/home/Smiley.png",
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text ?? "NO DATA AVAILABLE",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.textBlackColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (buttonText != null)
            Custombutton(
              width: width ?? 191.w,
              height: 50.h,
              text: buttonText!,
              onTap: onTap ?? () {},
              gradientColor: AppColors.primaryGradient,
              borderColor: Colors.transparent,
            ),
        ],
      ),
    );
  }
}
