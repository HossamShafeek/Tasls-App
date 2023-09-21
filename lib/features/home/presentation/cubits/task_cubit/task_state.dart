import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';

abstract class TaskState {}

class TaskInitialState extends TaskState {}

class ChangeDropdownValueState extends TaskState {}

class CreateTaskLoadingState extends TaskState {}

class CreateTaskSuccessState extends TaskState {
  final CreateTaskModel createTaskModel;

  CreateTaskSuccessState(this.createTaskModel);
}

class CreateTaskFailureState extends TaskState {
  final String error;

  CreateTaskFailureState(this.error);
}
