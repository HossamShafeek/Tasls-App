import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/custom_container_button.dart';
import 'package:tasks_app/features/home/presentation/views/update_task_view.dart';

import '../../features/home/data/models/tasks_model/datum.dart';

class TasksListViewItemHead extends StatelessWidget {
  const TasksListViewItemHead(
      {Key? key, required this.status, required this.taskModel})
      : super(key: key);

  final String status;
  final Datum taskModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          status,
          style: AppStyles.textStyle18.copyWith(
            color: AppColors.deepPurple,
          ),
        ),
        const Spacer(),
        CustomContainerButton(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return UpdateTaskView(
                  tasksModel: taskModel,
                );
              },
            ));
          },
          icon: IconBroken.Edit,
          padding: AppConstants.padding3h,
          color: AppColors.deepPurple,
          radius: AppConstants.radius5w,
          backgroundColor: AppColors.white,
          iconSize: AppConstants.iconSize22,
        ),
        SizedBox(
          width: AppConstants.padding15w,
        ),
        CustomContainerButton(
          onTap: () {},
          icon: IconBroken.Delete,
          padding: AppConstants.padding3h,
          color: AppColors.redAccent,
          radius: AppConstants.radius5w,
          backgroundColor: AppColors.white,
          iconSize: AppConstants.iconSize22,
        ),
      ],
    );
  }
}
