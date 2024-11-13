import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';

class HalfCircleButton extends StatelessWidget {
  const HalfCircleButton({
    super.key,
    required this.icon,
    required this.radius,
    required this.onTap,
    this.iconTurns = 0,
  });

  final IconData icon;
  final int iconTurns;
  final double radius;
  final VoidCallback? onTap;

  double get turns => (iconTurns % 4) * 0.25;

  @override
  Widget build(BuildContext context) {
    double iconSize = radius / 2.6;
    return Container(
      height: radius / 2,
      width: radius,
      alignment: Alignment.centerRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(1000000),
              bottomRight: Radius.circular(1000000),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: context.theme.colorScheme.secondary.withOpacity(0.3),
              highlightColor:
                  context.theme.colorScheme.onSurface.withOpacity(0.1),
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(bottom: (radius / 2) - iconSize),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  turns: turns,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: context.theme.colorScheme.onSecondary,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
