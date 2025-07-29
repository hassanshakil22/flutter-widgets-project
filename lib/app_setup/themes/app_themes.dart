import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/text_theme.dart';
class AppThemes {
  late final theme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    textTheme: AppTextTheme().textTheme,
    drawerTheme: drawerThemeData,
    // dividerColor: const Color(0xFFEEEEEE),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300),
    // dividerTheme: const DividerThemeData(color: Color(0xFFEEEEEE)),
    elevatedButtonTheme: elevationButtonTheme,
    textButtonTheme: textButtonTheme,
    cardColor: AppColors.primaryColor,
    appBarTheme: appBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    searchBarTheme: searchBarThemeData,
    snackBarTheme: snackbarTheme,
    bottomSheetTheme: bottomSheetTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.backgroundColor,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.white),
        elevation: WidgetStatePropertyAll(2.0),
      ),
    ),
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(Colors.white),
      checkColor: WidgetStatePropertyAll(AppColors.primaryColor),
    ),
    useMaterial3: true,
    // shadowColor: AppColors.shadowColor
  );

  final snackbarTheme = SnackBarThemeData(
    backgroundColor: AppColors.backgroundColor,
    insetPadding: const EdgeInsets.all(7),
    elevation: 1.0,
    behavior: SnackBarBehavior.floating,
    contentTextStyle: AppTextTheme.bodyMedium,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  final navigationBarTheme = const NavigationBarThemeData(
    backgroundColor: AppColors.primaryColor,
    surfaceTintColor: AppColors.primaryColor,
    elevation: 2.0,
    iconTheme: WidgetStatePropertyAll(
      IconThemeData(color: AppColors.blackColor),
    ),
    indicatorColor: AppColors.primaryColor,
  );
  final bottomNavigationBarTheme = const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundColor,
    elevation: 2.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primaryColor,
    unselectedIconTheme: IconThemeData(color: AppColors.backgroundColor),
    unselectedItemColor: AppColors.backgroundColor,
    selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
  );

  final AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    titleTextStyle: AppTextTheme.titleMedium.copyWith(color: Colors.white),
    backgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
  );
  final DrawerThemeData drawerThemeData = const DrawerThemeData(
    backgroundColor: AppColors.backgroundColor,
    shadowColor: AppColors.primaryColor,
  );

  final bottomSheetTheme = const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(240),
        topRight: Radius.circular(240),
      ),
    ),
  );

  final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(0)),

      foregroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
        ),
      ),
    ),
  );

  final elevationButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
      elevation: const WidgetStatePropertyAll(2.0),
      textStyle: WidgetStatePropertyAll(AppTextTheme.bodyMedium),
    ),
  );
  final searchBarThemeData = SearchBarThemeData(
    elevation: const WidgetStatePropertyAll(1.0),
    hintStyle: WidgetStatePropertyAll(AppTextTheme.bodyMedium),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    padding: const WidgetStatePropertyAll(EdgeInsets.all(5)),
    backgroundColor: const WidgetStatePropertyAll(AppColors.backgroundColor),
  );
}
