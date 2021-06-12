import 'package:flutter/material.dart';

class ChartBarProgress extends StatefulWidget {
  static const double progressBarRadius = 15;
  final double percent;
  ChartBarProgress({this.percent});

  @override
  _ChartBarProgressState createState() => _ChartBarProgressState();
}

class _ChartBarProgressState extends State<ChartBarProgress> {
  double progressBarHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      progressBarHeight = constraints.maxHeight;
      return Container(
        height: progressBarHeight,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius:
              BorderRadius.circular(ChartBarProgress.progressBarRadius),
          color: Colors.amber,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: progressBarHeight * widget.percent,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius:
                  BorderRadius.circular(ChartBarProgress.progressBarRadius),
            ),
          ),
        ),
      );
    });
  }
}
