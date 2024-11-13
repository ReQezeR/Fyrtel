import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
    this.radius = 30,
  });
  final double radius;
  final bool isFavorite;
  final VoidCallback onTap;

  Color _getBackgroundColor(ColorScheme colors) {
    return isFavorite ? Colors.transparent : colors.surface.withOpacity(0.38);
  }

  Color _getIconColor(ColorScheme colors) {
    return isFavorite ? colors.secondary : colors.surface;
  }

  Color _getEffectColor(ColorScheme colors) {
    return isFavorite
        ? colors.surface.withOpacity(0.38)
        : colors.secondary.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    Color backgroundColor = _getBackgroundColor(colors);
    Color iconColor = _getIconColor(colors);
    Color effectColor = _getEffectColor(colors);

    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: isFavorite ? Border.all(color: colors.surface) : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: effectColor,
          highlightColor: effectColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(double.infinity),
          ),
          child: Center(
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: iconColor,
              size: radius * 0.69,
            ),
          ),
        ),
      ),
    );
  }
}
