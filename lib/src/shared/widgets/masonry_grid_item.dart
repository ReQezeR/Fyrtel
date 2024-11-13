import 'package:flutter/material.dart';

class MasonryGridItem extends StatelessWidget {
  const MasonryGridItem({
    super.key,
    required this.child,
    this.heightFactor = 2,
  });
  final int heightFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
