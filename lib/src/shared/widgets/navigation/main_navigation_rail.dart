import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/shared/widgets/navigation/navigation_button.dart';
import 'package:fyrtel/src/shared/widgets/navigation/navigation_orientation_wrapper.dart';
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
      child: NavigationOrientationWrapper(
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
