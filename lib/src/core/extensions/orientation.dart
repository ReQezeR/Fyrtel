import 'package:flutter/material.dart';

extension OrientationExt on Orientation {
  bool get isPortrait => this == Orientation.portrait;
  bool get isLandscape => this == Orientation.landscape;
}
