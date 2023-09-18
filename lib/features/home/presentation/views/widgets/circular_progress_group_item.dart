import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';

class CircularProgressGroupItem extends StatelessWidget {
  const CircularProgressGroupItem(
      {Key? key,
      required this.percent,
      this.radius,
      required this.center,
      required this.progressColor,
      required this.backgroundColor})
      : super(key: key);

  final double percent;
  final double? radius;
  final String center;

  final Color progressColor;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius ?? AppConstants.circularSize22,
      percent: percent,
      center: Text(
        center,
        style: AppStyles.textStyle14,
      ),
      progressColor: progressColor,
      backgroundColor: backgroundColor,
    );
  }
}
