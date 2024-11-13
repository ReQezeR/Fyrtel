import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/sizes/landscape_app_sizes.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/background_video.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/action_home_card.dart';

class LandscapeSliverHomeAppbar extends StatelessWidget {
  final LandscapeAppSizes sizes;
  const LandscapeSliverHomeAppbar({
    super.key,
    required this.sizes,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    return SliverAppBar(
      collapsedHeight: 0,
      toolbarHeight: 0,
      expandedHeight: sizes.expandedAppbarHeight,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        collapseMode: CollapseMode.parallax,
        background: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: sizes.bodyWidth,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppbarFlexibleTitle(
                height: sizes.expandedAppbarHeight,
                width: sizes.bodyWidth / 2,
              ),
              AppbarFlexibleSideMenu(
                height: sizes.expandedAppbarHeight,
                width: sizes.bodyWidth / 2,
                padding: sizes.horizontalPadding,
                actions: [
                  ActionHomeCard(
                    label: 'Zaplanuj podróż',
                    imagePath: 'assets/images/road-map-icon.svg',
                    imageScale: 0.35,
                    imageMargin: const EdgeInsets.all(0),
                    tilePadding: EdgeInsets.all(sizes.gridSpacing),
                    backgroundColor: colors.secondary,
                    foregroundColor: colors.onSurface.withOpacity(0.8),
                    onTap: () {},
                  ),
                  ActionHomeCard(
                    label: 'Szlaki',
                    imagePath: 'assets/images/boots.svg',
                    imageScale: 0.4,
                    imageMargin: const EdgeInsets.symmetric(vertical: 5),
                    tilePadding: EdgeInsets.all(sizes.gridSpacing),
                    backgroundColor: colors.primary,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppbarFlexibleTitle extends StatelessWidget {
  const AppbarFlexibleTitle({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundVideo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width / 2.3,
              margin: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                "assets/images/logo_white.png",
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppbarFlexibleSideMenu extends StatelessWidget {
  const AppbarFlexibleSideMenu({
    super.key,
    required this.width,
    required this.height,
    required this.padding,
    required this.actions,
  });
  final double width;
  final double height;
  final EdgeInsets padding;
  final List<ActionHomeCard> actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...actions.map(
              (actionWidget) => SizedBox(
                width: width - padding.horizontal,
                height: (height - padding.horizontal) / actions.length,
                child: actionWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}
