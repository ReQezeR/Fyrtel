import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/core/extensions/orientation.dart';
import 'package:fyrtel/src/core/sizes/landscape_app_sizes.dart';
import 'package:fyrtel/src/di/injector.dart';
import 'package:fyrtel/src/shared/widgets/loading_spinner.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  State<BackgroundVideo> createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video/film.mp4',
    )..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  Widget _buildVideoContainer(double width, double height, ColorScheme colors) {
    return Container(
      color: colors.onSurface.withOpacity(0.9),
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: width,
          height: height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    bool isLandscape = MediaQuery.orientationOf(context).isLandscape;

    double width = 0;
    double height = 0;

    if (!_controller.value.isInitialized) {
      return const LoadingSpinner();
    }

    if (isLandscape) {
      LandscapeAppSizes sizes = getIt<LandscapeAppSizes>();
      double backgroundWidth = sizes.bodyWidth / 2;
      double backgroudHeight = sizes.expandedAppbarHeight;

      bool isFlipped = backgroundWidth > backgroudHeight;

      width = isFlipped ? backgroudHeight : backgroundWidth;
      height = isFlipped ? backgroundWidth : backgroudHeight;

      return _buildVideoContainer(width, height, colors);
    } else {
      width = _controller.value.size.width;
      height = _controller.value.size.height;

      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: _buildVideoContainer(width, height, colors),
      );
    }
  }
}
