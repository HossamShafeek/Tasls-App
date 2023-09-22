import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/widgets/tasks_list_view_item_body.dart';
import 'package:tasks_app/core/widgets/tasks_list_view_item_head.dart';

import '../../../data/models/tasks_model/datum.dart';

class UserTasksListViewItem extends StatelessWidget {
  const UserTasksListViewItem({Key? key, required this.taskModel})
      : super(key: key);

  final Datum taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.padding10h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppConstants.radius10w,
        ),
        color: AppColors.grey50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TasksListViewItemHead(
            status: taskModel.status!,
            taskModel: taskModel,
          ),
          TasksListViewItemBody(
            title: taskModel.name!,
            description: taskModel.description!,
            startDate: taskModel.startDate!,
            endDate: taskModel.endDate!,
          ),
        ],
      ),
    );
  }
}