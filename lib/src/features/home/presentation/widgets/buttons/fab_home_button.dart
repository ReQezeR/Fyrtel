import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/features/home/domain/home_scroll_controller.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';

class FabHomeButton extends StatelessWidget {
  final HomeScrollController controller;
  final double size;
  const FabHomeButton({
    super.key,
    required this.controller,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(bottom: 5, right: 5),
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: context.theme.colorScheme.secondary,
        splashColor: context.theme.colorScheme.secondaryFixed,
        elevation: 5,
        onPressed: () {
          controller.scrollUp();
        },
        child: Center(
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: context.theme.colorScheme.onSecondary,
              size: 22.scale,
            ),
          ),
        ),
      ),
    );
  }
}
