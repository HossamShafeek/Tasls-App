import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/create_task_view_body.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.titleForCreateTask),
      ),
      body: const CreateTaskViewBody(),
    );
  }
}