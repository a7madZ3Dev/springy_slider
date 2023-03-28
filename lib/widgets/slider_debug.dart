import 'package:flutter/material.dart';

class SliderDebug extends StatelessWidget {
  final double sliderPercent;
  final double paddingTop;
  final double paddingBottom;
  const SliderDebug({
    Key? key,
    required this.sliderPercent,
    required this.paddingTop,
    required this.paddingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final height = constraints.maxHeight - paddingTop - paddingBottom;
      return Stack(
        children: [
          Positioned(
            child: Container(
              height: 2.0,
              color: Colors.black,
            ),
            left: 0.0,
            right: 0.0,
            top: height * (1.0 - sliderPercent) + paddingTop,
          )
        ],
      );
    });
  }
}
