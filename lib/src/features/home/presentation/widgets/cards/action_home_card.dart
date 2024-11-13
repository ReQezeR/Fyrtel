import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/extensions/orientation.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/home_card_wrapper.dart';

class ActionHomeCard extends StatelessWidget {
  const ActionHomeCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.backgroundColor,
    this.foregroundColor,
    required this.imageMargin,
    required this.tilePadding,
    this.imageScale = 45,
    this.onTap,
  });
  final String label;
  final String imagePath;
  final double imageScale;
  final EdgeInsets imageMargin;
  final Color backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets tilePadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.orientationOf(context).isLandscape;
    ColorScheme colors = context.theme.colorScheme;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double availableWidth = constraints.maxWidth;
      double availableHeight = constraints.maxHeight;
      double imageSize = availableHeight * (imageScale);
      double scale =
          (isLandscape ? availableHeight / 120 : availableWidth / 175);

      return HomeCardWrapper(
        onTap: onTap,
        backgroundColor: backgroundColor,
        splashColor: backgroundColor,
        highlightColor: colors.onSurface,
        padding: tilePadding.copyWith(
          left: tilePadding.left * 1.5,
          bottom: tilePadding.bottom * 0.7,
        ),
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 15 * scale,
              height: 15 * scale,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3 * scale,
                    color: foregroundColor ?? colors.surface,
                  ),
                  right: BorderSide(
                    width: 3 * scale,
                    color: foregroundColor ?? colors.surface,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: imageMargin,
              width: imageSize,
              height: imageSize,
              child: SvgPicture.asset(
                imagePath,
                semanticsLabel: 'Home Action Button Icon',
                colorFilter: ColorFilter.mode(
                  (foregroundColor ?? colors.surface).withOpacity(0.54),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: availableWidth,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  textScaler: TextScaler.linear(scale),
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: foregroundColor ?? colors.surface),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
