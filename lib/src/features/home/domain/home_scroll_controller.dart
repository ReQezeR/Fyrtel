import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyrtel/src/core/extensions/double.dart';

class HomeScrollController {
  final ScrollController controller;
  double maxExtent = 1;
  double currentExtent = 1;
  double scrollExtent = 1;
  void Function()? _listener;

  HomeScrollController(
      {required this.controller,
      required this.maxExtent,
      required this.currentExtent,
      required this.scrollExtent});

  factory HomeScrollController.init({
    required double expandedAppbarHeight,
    required double scrollExtent,
  }) =>
      HomeScrollController(
        controller: ScrollController(),
        maxExtent: expandedAppbarHeight,
        currentExtent: expandedAppbarHeight,
        scrollExtent: scrollExtent,
      );

  ///Removes listener if exist and dispose ScrollController
  void dispose() {
    removeListener();
    controller.dispose();
  }

  double get ratio => currentExtent / maxExtent;

  double interpolation(double max) => currentExtent.linear(0, max);

  double get controllerOffset {
    try {
      return controller.hasClients ? controller.offset : 0;
    } catch (e) {
      return 0;
    }
  }

  void addListener(void Function() listener) {
    _listener = listener;
    controller.addListener(_listener!);
  }

  void removeListener() {
    if (_listener != null) {
      controller.removeListener(_listener!);
    }
  }

  Future<void> scrollDown() async => _scroll(0);

  Future<void> scrollUp() async => _scroll(scrollExtent);

  void _scroll(double position) {
    controller.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void updateCurrentExtent() {
    currentExtent = maxExtent - controller.offset;
    if (currentExtent < 0) currentExtent = 0.0;
    if (currentExtent > maxExtent) {
      currentExtent = maxExtent;
    }
  }

  double getScale() => 1 + 1.65 * currentExtent.linear(150, maxExtent + 250);

  double getOpacity() {
    double opacity = currentExtent / maxExtent;
    if (opacity <= 0.4) {
      return 0;
    } else if (opacity >= 0.95) {
      return 1;
    } else {
      return opacity - 0.4;
    }
  }
}
