import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/config/size_config.dart';
import 'package:fyrtel/src/di/injectable.dart';

extension SizeExt on num {
  double get h => this * locator<SizeConfig>().height / 100;

  double get w => this * locator<SizeConfig>().width / 100;

  double get sh => this * locator<SizeConfig>().safeHeight / 100;
  double get sw => this * locator<SizeConfig>().safeWidth / 100;

  double get dp => this * (w * 160) / locator<SizeConfig>().pixelRatio;

  double get scale => this * locator<SizeConfig>().scale;
}

extension InsetsScaler on EdgeInsets {
  EdgeInsets scale(double scale) => EdgeInsets.fromLTRB(
        left * scale,
        top * scale,
        right * scale,
        bottom * scale,
      );
}
