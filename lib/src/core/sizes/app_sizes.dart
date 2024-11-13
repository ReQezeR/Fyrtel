import 'package:flutter/material.dart';

abstract class AppSizes {
  double get colapsedAppbarHeight;
  double get expandedAppbarHeight;
  double get headerHeight;
  double get headerBottomSpace;
  double get appbarGroupHeight;
  double get bodyHeight;
  double get bodyWidth;
  double get scrollExtent;
  double get fabExtent;
  double get gridSpacing;
  double get navigationSize;
  double get fabSize;
  double get horizontalPaddingSize;
  EdgeInsets get horizontalPadding;
}
