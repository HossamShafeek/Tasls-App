import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';

class ListViewItemBody extends StatelessWidget {
  const ListViewItemBody(
      {Key? key,
      required this.firstTitle,
      required this.secondTitle,
      required this.secondTitleIcon,
      required this.thirdTitle,
      required this.thirdTitleIcon})
      : super(key: key);
  final String firstTitle;
  final String secondTitle;
  final IconData secondTitleIcon;
  final String thirdTitle;
  final IconData thirdTitleIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstTitle,
          style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                secondTitleIcon,
                size: AppConstants.iconSize18,
                color: AppColors.deepPurple,
              ),
              SizedBox(
                width: AppConstants.padding3w,
              ),
              Expanded(
                child: Text(
                  secondTitle,
                  style: AppStyles.textStyle14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              thirdTitleIcon,
              size: AppConstants.iconSize18,
              color: AppColors.deepPurple,
            ),
            SizedBox(
              width: AppConstants.padding3w,
            ),
            Text(
              thirdTitle,
              style: AppStyles.textStyle14,
            ),
          ],
        ),
      ],
    );
  }
}
