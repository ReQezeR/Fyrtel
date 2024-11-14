import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/sizes/portrait_app_sizes.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/features/article/domain/model/article_model.dart';
import 'package:fyrtel/src/features/article/presentation/bloc/filtered_articles_bloc.dart';
import 'package:fyrtel/src/features/home/domain/home_scroll_controller.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/article_home_card.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/action_home_card.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/buttons/fab_home_button.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/header/sliver_home_persistent_header.dart';
import 'package:fyrtel/src/core/extensions/double.dart';
import 'package:fyrtel/src/shared/extensions/list_extensions.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';
import 'package:fyrtel/src/shared/widgets/loading_spinner.dart';
import 'package:fyrtel/src/shared/widgets/masonry_grid_item.dart';
import 'package:fyrtel/src/shared/widgets/masonry_grid_view.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/appbar/portrait/sliver_home_appbar.dart';

class PortraitHomeLayout extends StatefulWidget {
  const PortraitHomeLayout({super.key});

  @override
  State<PortraitHomeLayout> createState() => _PortraitHomeLayoutState();
}

class _PortraitHomeLayoutState extends State<PortraitHomeLayout> {
  final PortraitAppSizes sizes = locator<PortraitAppSizes>();
  late final HomeScrollController _controller = HomeScrollController.init(
    expandedAppbarHeight: sizes.expandedAppbarHeight,
    scrollExtent: sizes.scrollExtent,
  );

  bool get isFabVisible => _controller.controllerOffset >= sizes.fabExtent;

  double sizeVariation({bool inverted = false, int decimals = 2}) {
    double interpolation = _controller.interpolation(sizes.appbarGroupHeight);
    if (inverted) {
      interpolation = 1 - interpolation;
    }
    return (sizes.headerBottomSpace * interpolation).roundToDecimals(decimals);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);

    BlocProvider.of<FilteredArticlesBloc>(context)
        .add(LoadFilteredArticlesEvent(null));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (mounted) {
      setState(() {
        _controller.updateCurrentExtent();
      });
    }
  }

  MasonryGridItem mapArticle(Article a) => MasonryGridItem(
        key: ValueKey(a.name.toString()),
        child: ArticleHomeCard(
          article: a,
          padding: EdgeInsets.all(sizes.gridSpacing),
          onTap: () {},
        ),
      );

  List<MasonryGridItem> mapArticles(List<Article> list) =>
      list.map((Article a) => mapArticle(a)).toList();

  Map<int, MasonryGridItem> actions(ColorScheme colors) => {
        0: MasonryGridItem(
          heightFactor: 1,
          child: ActionHomeCard(
            label: 'Zaplanuj podróż',
            imagePath: 'assets/images/road-map-icon.svg',
            imageScale: 0.4,
            imageMargin: const EdgeInsets.all(0),
            tilePadding: EdgeInsets.all(sizes.gridSpacing),
            backgroundColor: colors.secondary,
            foregroundColor: colors.onSurface.withOpacity(0.8),
            onTap: () {},
          ),
        ),
        2: MasonryGridItem(
          child: ActionHomeCard(
            label: 'Szlaki',
            imagePath: 'assets/images/boots.svg',
            imageScale: 0.3,
            imageMargin: const EdgeInsets.symmetric(vertical: 10),
            tilePadding: EdgeInsets.all(sizes.gridSpacing),
            backgroundColor: colors.primary,
            onTap: () {},
          ),
        ),
      };

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    double heightVariation = sizeVariation(inverted: true);
    double marginVariation = sizeVariation();

    return Scaffold(
      floatingActionButton: isFabVisible
          ? FabHomeButton(controller: _controller, size: sizes.fabSize)
          : null,
      body: CustomScrollView(
        controller: _controller.controller,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverHomeAppbar(
            controller: _controller,
            collapsedHeight: sizes.colapsedAppbarHeight,
          ),
          SliverHomePersistentHeader(
            controller: _controller,
            onMove: () => setState(() {}),
            minHeight: sizes.headerHeight.roundToDecimals(2),
            maxHeight: sizes.headerHeight - marginVariation,
            persistentExtent: sizes.headerHeight - marginVariation,
            heightExtent: heightVariation,
          ),
          SliverToBoxAdapter(
            child: Container(
              constraints: BoxConstraints(minHeight: sizes.bodyHeight),
              color: context.theme.colorScheme.surfaceDim,
              width: 100.w,
              padding: EdgeInsets.only(top: marginVariation, bottom: 16),
              child: BlocBuilder<FilteredArticlesBloc, FilteredArticlesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (List<Article> list) => MasonryGridView(
                      crossAxisCount: 2,
                      crossAxisSpacing: sizes.gridSpacing,
                      mainAxisSpacing: sizes.gridSpacing,
                      padding: sizes.horizontalPadding,
                      children: [
                        ...mapArticles(list).insertFromMap(actions(colors)),
                      ],
                    ),
                    orElse: () => const LoadingSpinner(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
