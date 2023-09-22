import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_state.dart';

class UpdateTextsFieldsSection extends StatelessWidget {
  const UpdateTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateTaskCubit, UpdateTaskState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              readOnly: LoginCubit.get(context).loginModel!.data!.userType=='employee'?true:false,
              maxLines: 2,
              controller: UpdateTaskCubit.get(context).titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter task title';
                }
                return null;
              },
              title: 'Title',
              hintText: 'Enter task title',
            ),
            CustomTextField(
              readOnly: LoginCubit.get(context).loginModel!.data!.userType=='employee'?true:false,
              maxLines: 4,
              controller: UpdateTaskCubit.get(context).descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter task description';
                }
                return null;
              },
              title: 'Description',
              hintText: 'Enter task description',
            ),
          ],
        );
      },
    );
  }
}