import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';

class HeaderRecommendationLabel extends StatelessWidget {
  const HeaderRecommendationLabel({
    super.key,
    this.width,
    this.height,
    required this.textScalerValue,
    required this.padding,
  });
  final double? width;
  final double? height;
  final double textScalerValue;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            "Polecane",
            textScaler: TextScaler.linear(textScalerValue),
            style: context.theme.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
