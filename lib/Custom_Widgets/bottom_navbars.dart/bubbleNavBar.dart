import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.w});

  final double w;

  @override
  Widget build(BuildContext context) {
    //use our provider or any statemanagement and variables inside it !!
    // final provider = context.watch<NavBarProvider>();
    final screenIndex = 0;
    // context.watch<NavBarProvider>().screenIndex;
    return Container(
      color: AppColors.backgroundColor,
      child: Container(
        height: 70.h,
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          gradient: AppColors.primaryGradient,
        ),
        width: w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavBarItem(
              iconAsset: "assets/home/home.svg",
              isTagSelected: screenIndex == 0,
              onTap: () {
                // context.read<NavBarProvider>().setToHomeScreen();
              },
            ),
            BottomNavBarItem(
              iconAsset: "assets/home/guard.svg",
              onTap: () {
                // context.read<NavBarProvider>().setToGuardScreen();  setToGuardScreen();
              },
              isTagSelected: screenIndex == 1,
            ),

            BottomNavBarItem(
              onTap: () {
                // context.read<NavBarProvider>().setToClientScreen(); setToClientScreen();
              },
              isTagSelected: screenIndex == 2,
              iconAsset: "assets/home/client.svg",
            ),
            BottomNavBarItem(
              onTap: () {
                // context.read<NavBarProvider>().setToLocationScreen(); setToLocationScreen();
              },
              isTagSelected: screenIndex == 3,
              iconAsset: "assets/home/location.svg",
            ),
            BottomNavBarItem(
              iconAsset: "assets/home/assign.svg",
              onTap: () {
                // context.read<NavBarProvider>().setToAssignScreen();  setToAssignScreen()
              },
              isTagSelected: screenIndex == 4,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.iconAsset,
    required this.onTap,
    required this.isTagSelected,
  });

  final bool isTagSelected;
  final String iconAsset;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return isTagSelected
        ? Transform.translate(
            offset: Offset(0, -30.h),
            child: Container(
              width: 56.sp,
              height: 56.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                border: Border.all(
                  color: AppColors.backgroundColor,
                  width: 3.sp,
                ),
              ),
              child: IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  iconAsset,
                  height: 34.h,
                  width: 34.w,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconAsset,
                    height: 34.h,
                    width: 34.w,
                    colorFilter: ColorFilter.mode(
                      isTagSelected
                          ? AppColors.primaryColor
                          : Colors.grey.shade600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
