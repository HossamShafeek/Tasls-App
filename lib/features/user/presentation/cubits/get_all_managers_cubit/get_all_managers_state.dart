import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';

abstract class GetAllManagersState {}

class GetAllManagersInitialState extends GetAllManagersState {}

class GetAllManagersLoadingState extends GetAllManagersState {}

class GetAllManagersSuccessState extends GetAllManagersState {
  final UsersModel managersModel;

  GetAllManagersSuccessState(this.managersModel);
}

class GetAllManagersFailureState extends GetAllManagersState {
  final String error;

  GetAllManagersFailureState(this.error);
}

class ChangeDropdownValueForManagerState extends GetAllManagersState {}
