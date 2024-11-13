import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/extensions/orientation.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class FilterChipButton extends StatelessWidget {
  const FilterChipButton({
    super.key,
    required this.active,
    required this.label,
    required this.onTap,
    required this.height,
  });
  final bool active;
  final String label;
  final VoidCallback onTap;
  final double height;

  Color _getBackgroundColor(ColorScheme colors) {
    return active ? colors.tertiary : colors.surface;
  }

  Color _getTextColor(ColorScheme colors) {
    return active ? colors.onTertiary : colors.onSurface;
  }

  Color _getEffectColor(ColorScheme colors) {
    return active
        ? colors.surface.withOpacity(0.38)
        : colors.tertiary.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.orientationOf(context).isLandscape;
    ColorScheme colors = context.theme.colorScheme;

    Color textColor = _getTextColor(colors);
    Color effectColor = _getEffectColor(colors);
    Color backgroundColor = _getBackgroundColor(colors);

    return Container(
      key: ValueKey("${label}FilterChipWidget"),
      constraints: BoxConstraints(
        minWidth: isLandscape ? 28.h : 28.w,
        maxHeight: height,
      ),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: effectColor,
          highlightColor: effectColor,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodyMedium
                    ?.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
