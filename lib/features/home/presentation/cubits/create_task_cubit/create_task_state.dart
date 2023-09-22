import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';

abstract class CreateTaskState {}

class CreateTaskInitialState extends CreateTaskState {}

class ChangeDropdownValueState extends CreateTaskState {}

class CreateTaskLoadingState extends CreateTaskState {}

class CreateTaskSuccessState extends CreateTaskState {
  final CreateTaskModel createTaskModel;

  CreateTaskSuccessState(this.createTaskModel);
}

class CreateTaskFailureState extends CreateTaskState {
  final String error;

  CreateTaskFailureState(this.error);
}
