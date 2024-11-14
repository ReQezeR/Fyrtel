import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyrtel/src/core/sizes/landscape_app_sizes.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/features/article/domain/model/article_model.dart';
import 'package:fyrtel/src/features/article/presentation/bloc/filtered_articles_bloc.dart';
import 'package:fyrtel/src/features/home/domain/home_scroll_controller.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/buttons/appbar_circle_button.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/article_home_card.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/appbar/landscape/landscape_sliver_home_appbar.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/header/sliver_home_persistent_header.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';
import 'package:fyrtel/src/shared/widgets/masonry_grid_item.dart';
import 'package:fyrtel/src/shared/widgets/masonry_grid_view.dart';

class LandscapeHomePage extends StatefulWidget {
  const LandscapeHomePage({super.key});

  @override
  State<LandscapeHomePage> createState() => _LandscapeHomePageState();
}

class _LandscapeHomePageState extends State<LandscapeHomePage> {
  final LandscapeAppSizes sizes = locator<LandscapeAppSizes>();
  late final HomeScrollController _controller = HomeScrollController.init(
    expandedAppbarHeight: sizes.expandedAppbarHeight,
    scrollExtent: sizes.scrollExtent,
  );

  @override
  void initState() {
    super.initState();
    _controller.controller.addListener(() {
      if (mounted) {
        setState(() {
          _controller.updateCurrentExtent();
        });
      }
    });
    BlocProvider.of<FilteredArticlesBloc>(context)
        .add(LoadFilteredArticlesEvent(null));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: _controller.controller,
          physics: const ClampingScrollPhysics(),
          slivers: [
            LandscapeSliverHomeAppbar(
              sizes: sizes,
            ),
            SliverHomePersistentHeader(
              controller: _controller,
              onMove: () => setState(() {}),
              minHeight: sizes.headerHeight,
              maxHeight: sizes.headerHeight,
              persistentExtent: 1,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey.shade200,
                width: MediaQuery.sizeOf(context).width,
                constraints: BoxConstraints(
                  minHeight: sizes.bodyHeight,
                ),
                child: BlocBuilder<FilteredArticlesBloc, FilteredArticlesState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (List<Article> list) => MasonryGridView(
                        crossAxisCount: 4,
                        padding: EdgeInsets.all(sizes.horizontalPaddingSize),
                        children: [
                          ...list.map((Article a) => mapArticle(a)),
                        ],
                      ),
                      orElse: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
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
          ),
        ),
      ],
    );
  }

  MasonryGridItem mapArticle(Article a) => MasonryGridItem(
        key: ValueKey(a.name.toString()),
        child: ArticleHomeCard(
          article: a,
          padding: EdgeInsets.all(sizes.gridSpacing),
          onTap: () {},
        ),
      );
}
