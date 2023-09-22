import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_state.dart';

class CreateTaskTextsFieldsSection extends StatelessWidget {
  const CreateTaskTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              controller: CreateTaskCubit.get(context).titleController,
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
              controller: CreateTaskCubit.get(context).descriptionController,
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
