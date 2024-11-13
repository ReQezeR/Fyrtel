import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/extensions/orientation.dart';
import 'package:fyrtel/src/core/sizes/portrait_app_sizes.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class AppbarCircleButton extends StatelessWidget {
  const AppbarCircleButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.radius,
    this.height,
    this.margin,
    this.semiTransparent = true,
  });
  final VoidCallback? onPressed;
  final IconData icon;
  final double? radius;
  final double? height;
  final EdgeInsets? margin;
  final bool semiTransparent;

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.orientationOf(context).isLandscape;
    double iconSize = max(30, isLandscape ? 7.h : 7.w);
    return SafeArea(
      child: Container(
        margin: margin ??
            EdgeInsets.only(
              left: PortraitSizeFactor.horizontalPaddingFactor.w,
              right: PortraitSizeFactor.horizontalPaddingFactor.w / 2,
            ),
        width: radius ?? max(43.5, 10.5.w),
        height: height ?? max(43, 10.5.w),
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 10.h,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: context.theme.colorScheme.surface.withOpacity(
                semiTransparent ? 0.7 : 1,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              shape: const CircleBorder(),
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: context.theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
