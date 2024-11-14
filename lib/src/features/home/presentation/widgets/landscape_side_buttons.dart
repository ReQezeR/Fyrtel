import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/sizes/landscape_app_sizes.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/buttons/appbar_circle_button.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class LandscapeSideButtons extends StatelessWidget {
  final LandscapeAppSizes sizes = locator<LandscapeAppSizes>();
  LandscapeSideButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 45.h,
        height: sizes.headerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppbarCircleButton(
              icon: Icons.menu,
              semiTransparent: false,
              onPressed: () {},
              margin: EdgeInsets.only(left: 2.h),
              height: sizes.headerHeight / 2,
              radius: 10.h,
            ),
            AppbarCircleButton(
              icon: Icons.favorite_border,
              semiTransparent: false,
              onPressed: () {},
              margin: EdgeInsets.only(left: 2.h),
              height: sizes.headerHeight / 2,
              radius: 10.h,
            ),
            AppbarCircleButton(
              icon: Icons.search,
              semiTransparent: false,
              onPressed: () {},
              margin: EdgeInsets.only(left: 2.h),
              height: sizes.headerHeight / 2,
              radius: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
