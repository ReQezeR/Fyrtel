import 'package:flutter/material.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/background_video.dart';

class LandscapeAppbarTitle extends StatelessWidget {
  const LandscapeAppbarTitle({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundVideo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width / 2.3,
              margin: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                "assets/images/logo_white.png",
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
