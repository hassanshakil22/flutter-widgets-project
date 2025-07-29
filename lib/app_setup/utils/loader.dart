import 'package:flutter/material.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 22,
        width: 22,
        margin: AppPaddings.smallX,
        child: const CircularProgressIndicator(
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
