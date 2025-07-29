import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFF8F8F8);
  static const Color primaryColor = Color.fromRGBO(255, 16, 20, 1);

  static const Color lightPrimaryColor = Color.fromRGBO(225, 163, 165, 1);
  static const Color blackColor = Color(0xFF222222);
  static const Color greyColor = Color.fromRGBO(78, 75, 102, 1);
  static const Color lightGreyColor = Color.fromRGBO(171, 175, 177, 1);
  static const Color lightPurpleColor = Color.fromRGBO(226, 230, 249, 0.6);
  static const Color lightGreenColor = Color.fromRGBO(223, 247, 226, 1);

  static Color shadowColor = Colors.black.withOpacity(0.1);
  static const mintColor = Color.fromRGBO(0, 199, 190, 1);
  static const blueColor = Color.fromRGBO(50, 153, 255, 1);
  static const darkGreen = Color.fromRGBO(14, 62, 62, 1);

  static const Color textFieldColor = Color.fromRGBO(226, 230, 249, 0.6);
  // Color(0xFFFAFAFA);
  static const Color textWhiteColor = Color(0xFFFFFFFF);
  static const Color textBlackColor = Color(0xFF212121);
  static const Color textGreyColor = Color(0xFF9E9E9E);
  static const Color buttonColor = Color(0x0066FF99);

  static const Color greenSuccessColor = Color(0xFF4AAF57);

  static LinearGradient linearGradient = const LinearGradient(
    colors: [Color(0xFF02AEA4), Color(0xFF2DD0C6)],
    begin: Alignment.bottomRight,
    end: Alignment.bottomLeft,
  );

  static LinearGradient imageGradient = const LinearGradient(
    colors: [Colors.black12, Colors.black87],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient primaryGradient = LinearGradient(
    colors: [Color.fromRGBO(255, 30, 39, 1), Color.fromRGBO(125, 20, 29, 1)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color.fromRGBO(232, 238, 251, 1),
      Color.fromRGBO(251, 252, 255, 1),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static LinearGradient redGradient = LinearGradient(
    colors: [Color.fromRGBO(235, 35, 35, 1), Color.fromRGBO(255, 65, 65, 0.5)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static LinearGradient blueGradient = LinearGradient(
    colors: [Color.fromRGBO(28, 150, 150, 1), Color.fromRGBO(0, 48, 73, 1)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
