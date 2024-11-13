import 'package:flutter/material.dart';
import 'package:fyrtel/src/shared/extensions/list_extensions.dart';
import 'package:fyrtel/src/shared/widgets/masonry_grid_item.dart';

class MasonryGridView extends StatelessWidget {
  const MasonryGridView({
    super.key,
    required this.children,
    this.crossAxisCount = 1,
    this.itemHeight = 80,
    this.mainAxisSpacing = 16.0,
    this.crossAxisSpacing = 16.0,
    this.padding,
  });
  final double itemHeight;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  final EdgeInsets? padding;
  final List<MasonryGridItem> children;

  double getWorkingWidth(double availableWidth) {
    double paddingSize = padding?.horizontal ?? 0;

    return availableWidth -
        (paddingSize + (crossAxisSpacing * (crossAxisCount - 1)));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double width = getWorkingWidth(availableWidth);
        double itemWidth = width / crossAxisCount;
        double minItemHeight = itemWidth / 2;

        double workingItemHeight =
            (itemHeight <= minItemHeight) ? minItemHeight : itemHeight;

        return Container(
          width: width,
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                crossAxisCount,
                (i) => SizedBox(
                  width: width / crossAxisCount,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...children
                          .asMap()
                          .entries
                          .where((entry) => entry.key % crossAxisCount == i)
                          .map((entry) => entry.value)
                          .map(
                            (MasonryGridItem item) => SizedBox(
                              width: itemWidth,
                              height: (workingItemHeight * item.heightFactor) +
                                  (mainAxisSpacing * (item.heightFactor - 1)),
                              child: item,
                            ),
                          )
                          .toList()
                          .insertBetween(
                            SizedBox(height: mainAxisSpacing),
                          ),
                    ],
                  ),
                ),
              ).insertBetween(SizedBox(width: crossAxisSpacing)),
            ],
          ),
        );
      },
    );
  }
}
