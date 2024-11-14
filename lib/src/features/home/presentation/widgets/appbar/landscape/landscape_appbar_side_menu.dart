import 'package:flutter/material.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/action_home_card.dart';

class LandscapeAppbarSideMenu extends StatelessWidget {
  const LandscapeAppbarSideMenu({
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
