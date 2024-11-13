import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/sizes/portrait_app_sizes.dart';
import 'package:fyrtel/src/di/injector.dart';
import 'package:fyrtel/src/features/home/domain/home_scroll_controller.dart';
import 'package:fyrtel/src/core/extensions/double.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class AppbarTitle extends StatelessWidget {
  final HomeScrollController controller;
  const AppbarTitle({super.key, required this.controller});

  EdgeInsetsGeometry? _getMargin() {
    if (controller.ratio > 0.6) {
      return EdgeInsets.only(bottom: 3.2.h * _getMarginScale());
    } else {
      return null;
    }
  }

  double _getMarginScale() {
    return controller.currentExtent.linear(
      controller.maxExtent - 160,
      controller.maxExtent - 60,
    );
  }

  double get rightPadding => 1 + (4 * (1 - _getMarginScale()));
  double get leftPadding => 5 * _getMarginScale();

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;

    return SafeArea(
      child: AnimatedScale(
        scale: controller.getScale(),
        duration: Duration.zero,
        child: Container(
          margin: _getMargin(),
          width: 28.w,
          height: getIt<PortraitAppSizes>().colapsedAppbarHeight,
          child: Padding(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: Stack(
              alignment: MediaQuery.paddingOf(context).vertical == 0
                  ? Alignment.center
                  : Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/images/logo_white.png",
                  color: colors.primary,
                ),
                Image.asset(
                  "assets/images/logo_white.png",
                  color: colors.onPrimary.withOpacity(controller.getOpacity()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
