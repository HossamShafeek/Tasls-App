import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_state.dart';

class CreateTaskTextsFieldsSection extends StatelessWidget {
  const CreateTaskTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Form(
          key: TaskCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: TaskCubit.get(context).titleController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please enter task title';
                  }
                  return null;
                },
                title: 'Title',
                hintText: 'Enter task title',
              ),
              CustomTextField(
                controller: TaskCubit.get(context).descriptionController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please enter task description';
                  }
                  return null;
                },
                title: 'Description',
                hintText: 'Enter task description',
              ),

            ],
          ),
        );
      },
    );
  }
}


