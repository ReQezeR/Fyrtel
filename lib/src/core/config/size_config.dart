import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class SizeConfig {
  double deviceWidth = 0;
  double deviceHeight = 0;
  double width = 0;
  double height = 0;
  double safeWidth = 0;
  double safeHeight = 0;

  double horizontalPadding = 0;
  double verticalPadding = 0;

  double pixelRatio = 2.625;
  double scale = 1;
  EdgeInsets viewPadding = EdgeInsets.zero;

  Orientation orientation = Orientation.portrait;

  void initialize(BuildContext context, Orientation orientation) {
    orientation = orientation;

    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    width = deviceWidth;
    height = deviceHeight;

    viewPadding = MediaQuery.of(context).viewPadding;
    verticalPadding = viewPadding.top + viewPadding.bottom;
    horizontalPadding = viewPadding.left + viewPadding.right;
    safeHeight = height - viewPadding.top;
    safeWidth = width - horizontalPadding;

    pixelRatio = MediaQuery.of(context).devicePixelRatio;

    scale = (safeHeight / safeWidth) / 2.625;
  }
}
