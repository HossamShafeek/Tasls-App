import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';

abstract class UpdateTaskState {}

class UpdateTaskInitialState extends UpdateTaskState {}

class ChangeDropdownValueState extends UpdateTaskState {}

class UpdateTaskLoadingState extends UpdateTaskState {}

class UpdateTaskSuccessState extends UpdateTaskState {
  final CreateTaskModel updateTaskModel;

  UpdateTaskSuccessState(this.updateTaskModel);
}

class UpdateTaskFailureState extends UpdateTaskState {
  final String error;

  UpdateTaskFailureState(this.error);
}

class ChangeRadioValueState extends UpdateTaskState{}