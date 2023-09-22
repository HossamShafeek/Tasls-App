import 'package:tasks_app/features/home/data/models/tasks_model/tasks_model.dart';

abstract class GetAllTasksState {}

class GetAllTasksInitialState extends GetAllTasksState {}

class GetAllTasksLoadingState extends GetAllTasksState {}

class GetAllTasksSuccessState extends GetAllTasksState {
  final TasksModel tasksModel;

  GetAllTasksSuccessState(this.tasksModel);
}

class GetAllTasksFailureState extends GetAllTasksState {
  final String error;

  GetAllTasksFailureState(this.error);
}

class ChangeViewAllState extends GetAllTasksState{}