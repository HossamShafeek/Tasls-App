import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/api/api_services_implementation.dart';
import 'package:tasks_app/core/widgets/date_picker_widget.dart';
import 'package:tasks_app/features/home/data/repository/home_repository_implementation.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/all_task_view_body.dart';

class AllTasksView extends StatelessWidget {
  const AllTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTasksCubit, GetAllTasksState>(
      builder: (context, state) {
        if (state is GetAllTasksSuccessState) {
          return Column(
            children: [
              const DatePickerWidget(),
              AllTasksListView(
                tasksModel: state.tasksModel,
              ),
            ],
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




