import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/config/size_config.dart';
import 'package:fyrtel/src/di/injector.dart';

extension SizeExt on num {
  double get h => this * getIt<SizeConfig>().height / 100;

  double get w => this * getIt<SizeConfig>().width / 100;

  double get sh => this * getIt<SizeConfig>().safeHeight / 100;
  double get sw => this * getIt<SizeConfig>().safeWidth / 100;

  double get dp => this * (w * 160) / getIt<SizeConfig>().pixelRatio;

  double get scale => this * getIt<SizeConfig>().scale;
}

extension InsetsScaler on EdgeInsets {
  EdgeInsets scale(double scale) => EdgeInsets.fromLTRB(
        left * scale,
        top * scale,
        right * scale,
        bottom * scale,
      );
}
