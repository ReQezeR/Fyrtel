import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/sizes/landscape_app_sizes.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/appbar/landscape/landscape_appbar_side_menu.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/appbar/landscape/landscape_appbar_title.dart';
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
              LandscapeAppbarTitle(
                height: sizes.expandedAppbarHeight,
                width: sizes.bodyWidth / 2,
              ),
              LandscapeAppbarSideMenu(
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
