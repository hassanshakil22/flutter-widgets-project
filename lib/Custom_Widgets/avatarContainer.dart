import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';

class Avatarcontainer extends StatelessWidget {
  const Avatarcontainer({
    super.key,
    required this.height,
    required this.width,
    required this.shadowColor,
    required this.color,
    required this.asset,
    this.assetColor,
  });

  final double height;
  final double width;
  final Color shadowColor;
  final Color color;
  final String asset;
  final Color? assetColor;

  bool get isSvg => asset.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: AppPaddings.tiny,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.sp),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
        color: color,
      ),
      child:
          isSvg
              ? SvgPicture.asset(
                asset,
                colorFilter:
                    assetColor != null
                        ? ColorFilter.mode(assetColor!, BlendMode.srcIn)
                        : null,
              )
              : Image.asset(asset, color: assetColor, fit: BoxFit.contain),
    );
  }
}
