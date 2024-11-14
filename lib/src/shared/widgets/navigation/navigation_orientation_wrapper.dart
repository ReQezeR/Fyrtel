import 'package:flutter/material.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class NavigationOrientationWrapper extends StatelessWidget {
  const NavigationOrientationWrapper(
      {super.key, required this.children, required this.size});
  final List<Widget> children;
  final double size;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: size,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: children,
          ),
        );
      } else {
        return SafeArea(
          child: SizedBox(
            width: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: children,
            ),
          ),
        );
      }
    });
  }
}
