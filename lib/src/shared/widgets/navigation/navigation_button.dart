import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.dimension = 70,
  });
  final IconData icon;
  final String label;
  final double dimension;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    Orientation orientation = MediaQuery.orientationOf(context);
    bool isLandscape = orientation == Orientation.landscape;
    return Container(
      width: isLandscape ? dimension : 24.w,
      height: isLandscape ? null : dimension,
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: dimension,
            child: InkResponse(
              onTap: onTap,
              enableFeedback: true,
              highlightColor: colors.secondary,
              radius: max(dimension / 2.5, (isLandscape ? 24.h : 24.w) / 2.5),
              highlightShape: BoxShape.circle,
              child: SizedBox(
                width: dimension,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 24,
                        color: Colors.grey.shade800,
                        weight: 700,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: context.theme.textTheme.titleSmall,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
