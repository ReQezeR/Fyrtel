import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/orientation.dart';
import 'package:fyrtel/src/core/sizes/landscape_app_sizes.dart';
import 'package:fyrtel/src/core/sizes/portrait_app_sizes.dart';
import 'package:fyrtel/src/di/injector.dart';
import 'package:fyrtel/src/shared/widgets/navigation/main_navigation_rail.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation.isLandscape) {
        return Row(
          children: [
            Flexible(
              child: widget.child,
            ),
            MainNavigationRail(
              size: getIt<LandscapeAppSizes>().navigationSize,
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Flexible(
              child: widget.child,
            ),
            MainNavigationRail(
              size: getIt<PortraitAppSizes>().navigationSize,
            )
          ],
        );
      }
    });
  }
}
