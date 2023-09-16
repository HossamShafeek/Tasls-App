import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/utils/app_styles.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'WelcomeBack!',
          style: AppStyles.textStyle34,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.defaultPadding),
          child: Text(
            AppStrings.subtitle,
            style: AppStyles.textStyle16.copyWith(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
