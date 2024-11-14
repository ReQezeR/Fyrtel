import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/config/size_config.dart';
import 'package:fyrtel/src/core/sizes/app_sizes.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';
import 'package:injectable/injectable.dart';

class PortraitSizeFactor {
  ///16
  static const double appbarHeightFactor = 16; //h

  ///14.5
  static const double headerHeightFactor = 14.5; //h

  /// 3.75
  static const double horizontalPaddingFactor = 3.75; //w

  /// 3.125
  static const double gridSpacingFactor = 3.125; //w

  static const double filterChipHeightFactor = 4.3; //h

  static const double wrapRunSpacingFactor = 2.9; //h
}

@lazySingleton
class PortraitAppSizes implements AppSizes {
  SizeConfig get config => locator<SizeConfig>();

  @override
  double get colapsedAppbarHeight => 16.h - config.verticalPadding;

  @override
  double get expandedAppbarHeight => 53.94.sh + config.verticalPadding;

  @override
  double get headerHeight => 14.5.h;

  @override
  double get headerBottomSpace => 0.167 * headerHeight;

  @override
  double get appbarGroupHeight => colapsedAppbarHeight + headerHeight;

  @override
  double get bodyHeight => 69.5.h + config.verticalPadding;

  @override
  double get bodyWidth => 100.w;

  @override
  double get scrollExtent =>
      bodyHeight - appbarGroupHeight - (0.166 * headerHeight / 2);

  @override
  double get gridSpacing => 3.125.w;

  @override
  double get fabExtent => bodyHeight - navigationSize + fabSize;

  @override
  double get fabSize => max(55, 13.w);

  @override
  double get navigationSize => 10.5.h;

  @override
  double get horizontalPaddingSize => 3.75.w;

  @override
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: horizontalPaddingSize);
}
