import 'package:flutter/material.dart';

import './slider_clipper.dart';
import '../controllers/springy_slider_controller.dart';

class SliderGoo extends StatelessWidget {
  final double paddingTop;
  final double paddingBottom;
  final SpringySliderController sliderController;
  final Widget child;
  const SliderGoo({
    Key? key,
    required this.paddingTop,
    required this.paddingBottom,
    required this.sliderController,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SliderClipper(
        sliderController: sliderController,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
      ),
      child: child,
    );
  }
}
