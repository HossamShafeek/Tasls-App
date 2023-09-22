import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/data/models/tasks_model/tasks_model.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/all_tasks_list_view_item.dart';

class AllTasksListView extends StatelessWidget {
  const AllTasksListView({Key? key, required this.tasksModel})
      : super(key: key);

  final TasksModel tasksModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: tasksModel.data!.length,
        itemBuilder: (context, index) {
          return TasksListViewItem(
            taskModel: tasksModel.data![index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: AppConstants.padding10h,
          );
        },
      ),
    );
  }
}