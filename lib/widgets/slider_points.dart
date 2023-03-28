import 'package:flutter/material.dart';

import '../widgets/points.dart';
import '../controllers/springy_slider_controller.dart';

class SliderPoints extends StatelessWidget {
  final double paddingTop;
  final double paddingBottom;
  final SpringySliderController sliderController;
  const SliderPoints({
    Key? key,
    required this.paddingTop,
    required this.paddingBottom,
    required this.sliderController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        double sliderPercent = sliderController.sliderValue;
        if (sliderController.state == SpringySliderState.dragging) {
          sliderPercent = sliderController.draggingPercent.clamp(0.0, 1.0);
        }
        final height = constraints.maxHeight - paddingTop - paddingBottom;
        final sliderY = height * (1.0 - sliderPercent) + paddingTop;
        final pointsYouNeedPercent = 1.0 - sliderPercent;
        final pointsYouNeed = (100 * pointsYouNeedPercent).round();
        final pointsYouHavePercent = sliderPercent;
        final pointsYouHave = 100 - pointsYouNeed;
        return Stack(
          children: [
            Positioned(
              child: FractionalTranslation(
                translation: const Offset(0.0, -1.0),
                child: Points(
                  points: pointsYouNeed,
                  isAboveSlider: true,
                  isPointsYouNeed: true,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              left: 30.0,
              top: sliderY - 10.0 - (40.0 * pointsYouNeedPercent),
            ),
            Positioned(
              child: Points(
                points: pointsYouHave,
                isAboveSlider: false,
                isPointsYouNeed: false,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              left: 30.0,
              top: sliderY + 10.0 + (40.0 * pointsYouHavePercent),
            )
          ],
        );
      },
    );
  }
}
