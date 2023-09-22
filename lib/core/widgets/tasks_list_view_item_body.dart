import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:expandable_text/expandable_text.dart';


class TasksListViewItemBody extends StatelessWidget {
  const TasksListViewItemBody(
      {Key? key,
        required this.title,
        required this.description,
        required this.startDate,
        required this.endDate,})
      : super(key: key);

  final String title;
  final String description;
  final String startDate;
  final String endDate;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppConstants.padding3h,
        ),
        Text(
          title,
          style: AppStyles.textStyle18.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.padding3h),
          child: ExpandableText(
            description,
            expandText: 'Read More',
            collapseText: 'Show Less',
            style: AppStyles.textStyle16.copyWith(),
            maxLines: 2,
            linkColor: AppColors.redAccent,
          ),
        ),
        Row(
          children: [
            Icon(
              IconBroken.Time_Circle,
              size: AppConstants.iconSize22,
              color: AppColors.redAccent,
            ),
            SizedBox(
              width: AppConstants.padding5w,
            ),
            Text(
              'Starts ${DateFormat('dd/MM/yyyy').format(DateTime.parse(startDate.toString()))} '
                  '- Ends ${DateFormat('dd/MM/yyyy').format(DateTime.parse(endDate.toString()))}',
              style: AppStyles.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}