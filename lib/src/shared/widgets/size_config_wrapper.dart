import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/config/size_config.dart';
import 'package:fyrtel/src/di/injectable.dart';

class SizeConfigWraper extends StatelessWidget {
  const SizeConfigWraper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      locator<SizeConfig>().initialize(context, orientation);
      return child;
    });
  }
}
