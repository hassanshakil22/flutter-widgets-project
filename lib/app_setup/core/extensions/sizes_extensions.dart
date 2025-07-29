import 'package:flutter/widgets.dart';

extension MediaQuerySizes on BuildContext {
  double get hei => MediaQuery.sizeOf(this).height;
  double get wid => MediaQuery.sizeOf(this).width;

  double get halfY => MediaQuery.sizeOf(this).height * 0.5;
  double get halfX => MediaQuery.sizeOf(this).width * 0.5;
}
