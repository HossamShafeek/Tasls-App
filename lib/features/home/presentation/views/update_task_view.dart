import 'package:flutter/material.dart';
import 'package:tasks_app/core/functions/get_task_number.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/home/data/models/tasks_model/datum.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/update_task_view_body.dart';


class UpdateTaskView extends StatefulWidget {
  const UpdateTaskView({
    Key? key,
    required this.tasksModel,
  }) : super(key: key);

  final Datum tasksModel;

  @override
  State<UpdateTaskView> createState() => _UpdateTaskViewState();
}

class _UpdateTaskViewState extends State<UpdateTaskView> {
  @override
  void initState() {
    UpdateTaskCubit.get(context).groupValue =
        getTaskNumber(taskStatus: widget.tasksModel.status!);
    UpdateTaskCubit.get(context).titleController.text = widget.tasksModel.name!;
    UpdateTaskCubit.get(context).descriptionController.text =
        widget.tasksModel.description!;
    UpdateTaskCubit.get(context)
        .multiDatePickerValueWithDefaultValue
        .add(DateTime.parse(widget.tasksModel.startDate!));
    UpdateTaskCubit.get(context)
        .multiDatePickerValueWithDefaultValue
        .add(DateTime.parse(widget.tasksModel.endDate!));

    super.initState();
  }

  @override
  void deactivate() {
    UpdateTaskCubit.get(context)
        .multiDatePickerValueWithDefaultValue=[];
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.titleForUpdateTask),
      ),
      body:  UpdateTaskViewBody(
        taskId: widget.tasksModel.id.toString(),
        employeeId: widget.tasksModel.employee!.id.toString(),
      ),
    );
  }
}


