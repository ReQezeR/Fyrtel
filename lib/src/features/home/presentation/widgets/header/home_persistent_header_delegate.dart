import 'package:flutter/material.dart';

class HomePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;
  final Widget child;
  final bool? isPaidFilter;
  final double? extent;
  final double heightExtent;

  HomePersistentHeaderDelegate({
    required this.child,
    required this.minExtent,
    required this.maxExtent,
    required this.isPaidFilter,
    required this.heightExtent,
    this.extent,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(child: child);
  }

  @override
  bool shouldRebuild(HomePersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent ||
        isPaidFilter != oldDelegate.isPaidFilter ||
        heightExtent != oldDelegate.heightExtent ||
        (extent != null && extent != oldDelegate.extent);
  }
}
