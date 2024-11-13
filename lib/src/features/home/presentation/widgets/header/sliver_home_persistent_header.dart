import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/sizes/portrait_app_sizes.dart';
import 'package:fyrtel/src/features/article/presentation/filtered_articles/filtered_articles_bloc.dart';
import 'package:fyrtel/src/features/home/domain/home_scroll_controller.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/buttons/filter_chip_button.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/buttons/half_circle_button.dart';
import 'package:fyrtel/src/core/extensions/double.dart';
import 'package:fyrtel/src/core/extensions/orientation.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/header/header_recommendation_label.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/header/home_persistent_header_delegate.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class SliverHomePersistentHeader extends StatefulWidget {
  final HomeScrollController controller;
  final VoidCallback onMove;
  final double minHeight;
  final double maxHeight;
  final double persistentExtent;
  final double heightExtent;
  const SliverHomePersistentHeader({
    super.key,
    required this.controller,
    required this.onMove,
    required this.maxHeight,
    required this.minHeight,
    required this.persistentExtent,
    this.heightExtent = 12,
  });

  @override
  State<SliverHomePersistentHeader> createState() =>
      _SliverHomePersistentHeaderState();
}

class _SliverHomePersistentHeaderState
    extends State<SliverHomePersistentHeader> {
  bool? _isPaidFilter;

  void toogleFilter(bool? filter) {
    setState(() {
      if (_isPaidFilter == null || _isPaidFilter != filter) {
        _isPaidFilter = filter;
      } else {
        _isPaidFilter = null;
      }
    });
    BlocProvider.of<FilteredArticlesBloc>(context)
        .add(LoadFilteredArticlesEvent(_isPaidFilter));
  }

  bool get isScrollUpward =>
      widget.controller.currentExtent > (widget.persistentExtent + 48);

  void onAppbarToggle() {
    if (isScrollUpward) {
      widget.controller.scrollUp().then((value) => widget.onMove());
    } else {
      widget.controller.scrollDown().then((value) => widget.onMove());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.orientationOf(context).isLandscape;

    double chipsHeight = (isLandscape ? 0.45 : 0.283) * widget.minHeight;
    double topPadding = (isLandscape ? 0.0 : 0.167) * widget.minHeight;

    double workingHeight =
        (isLandscape ? widget.minHeight : (widget.minHeight - topPadding));

    double scrollOffset = widget.controller.controller.offset;

    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: HomePersistentHeaderDelegate(
        minExtent: widget.maxHeight,
        maxExtent: widget.maxHeight,
        heightExtent: widget.heightExtent,
        isPaidFilter: _isPaidFilter,
        extent: widget.controller.currentExtent,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: PortraitSizeFactor.horizontalPaddingFactor.w,
          ),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceDim,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: workingHeight,
                  maxHeight: workingHeight,
                ),
                height: widget.minHeight,
                padding: EdgeInsets.only(top: topPadding / 1.7),
                alignment: isLandscape ? Alignment.centerLeft : null,
                child: Wrap(
                  spacing: isLandscape ? 5.w : 80.w,
                  crossAxisAlignment: isLandscape
                      ? WrapCrossAlignment.center
                      : WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    isLandscape
                        ? HeaderRecommendationLabel(
                            width: max(113, 28.h),
                            height: workingHeight - topPadding,
                            textScalerValue: 50.w,
                            padding: EdgeInsets.only(
                              left: 42.h * scrollOffset.linear(0, 70.h),
                            ),
                          )
                        : HeaderRecommendationLabel(
                            width: max(113, 28.w),
                            textScalerValue: widget.minHeight / 125,
                            padding: const EdgeInsets.only(left: 2),
                          ),
                    Wrap(
                      spacing: max(8, 2.3.w),
                      children: [
                        FilterChipButton(
                          active: _isPaidFilter == true,
                          label: 'Płatne',
                          onTap: () => toogleFilter(true),
                          height: chipsHeight,
                        ),
                        FilterChipButton(
                          active: _isPaidFilter == false,
                          label: 'Bezpłatne',
                          onTap: () => toogleFilter(false),
                          height: chipsHeight,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: HalfCircleButton(
                  radius: isLandscape ? 18.h : 15.w,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconTurns: isScrollUpward ? 1 : 3,
                  onTap: onAppbarToggle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
