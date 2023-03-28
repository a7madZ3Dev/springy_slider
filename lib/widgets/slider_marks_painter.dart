import 'dart:ui';

import 'package:flutter/material.dart';

class SliderMarksPainter extends CustomPainter {
  final double largeMarkWidth = 35.0;
  final double smallMarkWidth = 10.0;
  final int markCount;
  final Color markColor;
  final Color backgroundColor;
  final double markThickness;
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final Paint markPaint;
  final Paint backgroundPaint;
  SliderMarksPainter({
    required this.markCount,
    required this.markColor,
    required this.backgroundColor,
    required this.markThickness,
    required this.paddingTop,
    required this.paddingBottom,
    required this.paddingRight,
  })  : markPaint = Paint()
          ..color = markColor
          ..strokeWidth = markThickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
        backgroundPaint = Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height), backgroundPaint);
    final paintHeight = size.height - paddingTop - paddingBottom;
    final gap = paintHeight / (markCount - 1);
    for (int i = 0; i < markCount; i++) {
      double? markWidth = smallMarkWidth;
      if (i == 0 || i == markCount - 1) {
        markWidth = largeMarkWidth;
      } else if (i == 1 || i == markCount - 2) {
        markWidth = lerpDouble(smallMarkWidth, largeMarkWidth, 0.5);
      }

      final markY = i * gap + paddingTop;
      canvas.drawLine(Offset(size.width - paddingRight - markWidth!, markY),
          Offset(size.width - paddingRight, markY), markPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
