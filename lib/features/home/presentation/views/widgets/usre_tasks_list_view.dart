import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/all_tasks_list_view_item.dart';

class UserTasksListView extends StatelessWidget {
  const UserTasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTasksCubit, GetAllTasksState>(
      builder: (context, state) {
        if (state is GetAllTasksSuccessState) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom:AppConstants.padding5h),
              physics: const BouncingScrollPhysics(),
              itemCount: state.tasksModel.data!.length,
              itemBuilder: (context, index) {
                return TasksListViewItem(
                  taskModel: state.tasksModel.data![index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: AppConstants.padding10h,
                );
              },
            ),
          );
        } else if (state is GetAllTasksFailureState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}