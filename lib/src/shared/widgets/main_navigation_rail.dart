import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class MainNavigationRail extends StatefulWidget {
  const MainNavigationRail({super.key, required this.size});
  final double size;

  @override
  State<MainNavigationRail> createState() => _MainNavigationRailState();
}

class _MainNavigationRailState extends State<MainNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.colorScheme.surfaceDim,
      child: OrientationWrapper(
        size: widget.size,
        children: [
          NavigationButton(
            icon: Symbols.home,
            label: 'Śląskie.',
            onTap: () => print('Śląskie.'),
            dimension: widget.size,
          ),
          NavigationButton(
            icon: Symbols.contract,
            label: 'Aktualności',
            onTap: () => print('Aktualności'),
            dimension: widget.size,
          ),
          NavigationButton(
            icon: Symbols.calendar_month,
            label: 'Wydarzenia',
            onTap: () => print('Wydarzenia'),
            dimension: widget.size,
          ),
          NavigationButton(
            icon: Symbols.map,
            label: 'Eksploruj',
            onTap: () => print('Eksploruj'),
            dimension: widget.size,
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.dimension = 70,
  });
  final IconData icon;
  final String label;
  final double dimension;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    Orientation orientation = MediaQuery.orientationOf(context);
    bool isLandscape = orientation == Orientation.landscape;
    return Container(
      width: isLandscape ? dimension : 24.w,
      height: isLandscape ? null : dimension,
      padding: const EdgeInsets.all(0),
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: dimension,
            child: InkResponse(
              onTap: onTap,
              enableFeedback: true,
              highlightColor: colors.secondary,
              radius: max(dimension / 2.5, (isLandscape ? 24.h : 24.w) / 2.5),
              highlightShape: BoxShape.circle,
              child: SizedBox(
                width: dimension,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 24,
                        color: Colors.grey.shade800,
                        weight: 700,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: context.theme.textTheme.titleSmall,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrientationWrapper extends StatelessWidget {
  const OrientationWrapper(
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
