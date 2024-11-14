import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/config/size_config.dart';
import 'package:fyrtel/src/core/sizes/app_sizes.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';
import 'package:injectable/injectable.dart';

class LandscapeSizeFactor {
  static const double appbarHeightFactor = 16;
  static const double headerHeightFactor = 14.5;

  static const double horizontalPaddingFactor = 3.75;
  static const double gridSpacingFactor = 3.125;
}

@lazySingleton
class LandscapeAppSizes implements AppSizes {
  SizeConfig get config => locator<SizeConfig>();

  @override
  double get colapsedAppbarHeight => 0.h;

  @override
  double get expandedAppbarHeight =>
      100.h - config.verticalPadding - headerHeight;

  @override
  double get headerHeight => 20.h;

  @override
  double get headerBottomSpace => 0.167 * headerHeight;

  @override
  double get appbarGroupHeight => colapsedAppbarHeight + headerHeight;

  @override
  double get bodyHeight => 100.h - config.verticalPadding - headerHeight;

  @override
  double get bodyWidth => 100.w - config.horizontalPadding - navigationSize;

  @override
  double get scrollExtent => bodyHeight;

  @override
  double get gridSpacing => 3.125.h;

  @override
  double get fabExtent => bodyHeight - navigationSize + fabSize;

  @override
  double get fabSize => max(55, 13.h);

  @override
  double get navigationSize => 11.w;

  @override
  double get horizontalPaddingSize => 3.75.h;

  @override
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: horizontalPaddingSize);
}
