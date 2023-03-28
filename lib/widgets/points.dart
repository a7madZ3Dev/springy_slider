import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  final int points;
  final bool isAboveSlider;
  final bool isPointsYouNeed;
  final Color color;
  const Points({
    Key? key,
    required this.points,
    required this.isAboveSlider,
    required this.isPointsYouNeed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percent = points / 100.0;
    final pointTextSize = 50.0 + (50.0 * percent);
    return Row(
      crossAxisAlignment:
          isAboveSlider ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        FractionalTranslation(
          translation: Offset(-0.05 * percent, isAboveSlider ? 0.18 : -0.18),
          child: Text(
            '$points',
            style: TextStyle(fontSize: pointTextSize, color: color),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text('POINTS',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: color)),
              ),
              Text(
                isPointsYouNeed ? 'YOU NEED' : 'YOU HAVE',
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        )
      ],
    );
  }
}
