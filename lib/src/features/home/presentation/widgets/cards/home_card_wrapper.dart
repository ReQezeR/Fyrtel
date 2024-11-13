import 'package:flutter/material.dart';

class HomeCardWrapper extends StatelessWidget {
  const HomeCardWrapper({
    super.key,
    required this.backgroundColor,
    required this.splashColor,
    required this.highlightColor,
    required this.children,
    this.image,
    this.onTap,
    this.padding,
  });
  final Color backgroundColor;
  final Color splashColor;
  final Color highlightColor;
  final VoidCallback? onTap;
  final List<Widget> children;
  final DecorationImage? image;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        image: image,
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: splashColor.withOpacity(0.3),
          highlightColor: highlightColor.withOpacity(0.1),
          child: Container(
            padding: padding,
            child: Stack(
              fit: StackFit.expand,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
