import 'package:flutter/material.dart';

import './slider_marks_painter.dart';

class SliderMarks extends StatelessWidget {
  final int markCount;
  final Color markColor;
  final Color backgroundColor;
  final double paddingTop;
  final double paddingBottom;
  const SliderMarks({
    Key? key,
    required this.markCount,
    required this.markColor,
    required this.backgroundColor,
    required this.paddingTop,
    required this.paddingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SliderMarksPainter(
        markCount: markCount,
        markColor: markColor,
        backgroundColor: backgroundColor,
        markThickness: 2.0,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
        paddingRight: 15.0,
      ),
      child: Container(),
    );
  }
}
