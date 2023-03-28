import 'package:flutter/material.dart';

import './slider_goo.dart';
import './slider_marks.dart';
import './slider_points.dart';
import './slider_dragger.dart';
import '../controllers/springy_slider_controller.dart';

class SpringySliderWidget extends StatefulWidget {
  final int? markCount;
  final Color? positiveColor;
  final Color? negativeColor;
  const SpringySliderWidget({
    Key? key,
    this.markCount,
    this.positiveColor,
    this.negativeColor,
  }) : super(key: key);

  @override
  _SpringySliderState createState() => _SpringySliderState();
}

class _SpringySliderState extends State<SpringySliderWidget>
    with TickerProviderStateMixin {
  final double paddingTop = 50.0;
  final double paddingBottom = 50.0;

  late SpringySliderController sliderController;

  @override
  void initState() {
    super.initState();
    sliderController = SpringySliderController(
      sliderPresent: 0.5,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    double sliderPercent = sliderController.sliderValue;
    if (sliderController.state == SpringySliderState.springing) {
      sliderPercent = sliderController.springingPercent;
    }

    return SliderDragger(
      sliderController: sliderController,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      child: Stack(
        children: [
          SliderMarks(
            markCount: widget.markCount!,
            markColor: widget.positiveColor!,
            backgroundColor: widget.negativeColor!,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          SliderGoo(
            sliderController: sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            child: SliderMarks(
              markCount: widget.markCount!,
              markColor: widget.negativeColor!,
              backgroundColor: widget.positiveColor!,
              paddingTop: paddingTop,
              paddingBottom: paddingBottom,
            ),
          ),
          SliderPoints(
            sliderController: sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          // SliderDebug(
          //   sliderPercent: sliderController.state == SpringySliderState.dragging
          //       ? sliderController.draggingPercent
          //       : sliderPercent,
          //   paddingTop: paddingTop,
          //   paddingBottom: paddingBottom,
          // )
        ],
      ),
    );
  }
}
