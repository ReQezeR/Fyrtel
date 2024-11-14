import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/sizes/portrait_app_sizes.dart';
import 'package:fyrtel/src/features/home/domain/home_scroll_controller.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/buttons/appbar_circle_button.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/appbar/portrait/appbar_title.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/background_video.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class SliverHomeAppbar extends StatelessWidget {
  final HomeScrollController controller;
  final double collapsedHeight;
  const SliverHomeAppbar({
    super.key,
    required this.controller,
    required this.collapsedHeight,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    double leadingWidth = max(72, 16.w);

    return SliverAppBar(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surface,
      leadingWidth: leadingWidth,
      leading: Align(
        alignment: Alignment.center,
        child: AppbarCircleButton(
          icon: Icons.menu_rounded,
          onPressed: () {}, //TODO open Menu drawer
          height: collapsedHeight,
          margin: EdgeInsets.symmetric(
            horizontal: PortraitSizeFactor.horizontalPaddingFactor.w,
          ),
        ),
      ),
      actions: [
        AppbarCircleButton(
          icon: Icons.favorite_border,
          onPressed: () {}, //TODO open Favourites page
          height: collapsedHeight,
        ),
        AppbarCircleButton(
          icon: Icons.search,
          onPressed: () {}, //TODO open Search page
          height: collapsedHeight,
        ),
      ],
      pinned: true,
      floating: false,
      centerTitle: true,
      collapsedHeight: collapsedHeight,
      toolbarHeight: collapsedHeight,
      expandedHeight: controller.maxExtent,
      flexibleSpace: FlexibleSpaceBar.createSettings(
        hasLeading: true,
        isScrolledUnder: true,
        minExtent: 0,
        maxExtent: controller.maxExtent,
        currentExtent: controller.currentExtent,
        child: FlexibleSpaceBar(
          centerTitle: true,
          expandedTitleScale: 1.0,
          titlePadding: EdgeInsets.only(top: collapsedHeight * 0.38),
          collapseMode: CollapseMode.parallax,
          title: AppbarTitle(controller: controller),
          background: Opacity(
            opacity: controller.getOpacity(),
            child: const BackgroundVideo(),
          ),
        ),
      ),
    );
  }
}
