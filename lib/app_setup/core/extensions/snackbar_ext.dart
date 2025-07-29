import 'package:flutter/material.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/utils/app_alerts.dart';
extension AppAlerts on BuildContext {
  void showSnackBar(String message, {Color color = AppColors.primaryColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      snackBarContent(message: message, color: color, context: this),
    );
  }
}
