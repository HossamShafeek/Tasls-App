import 'package:tasks_app/features/user/data/models/user_model/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserModel departmentModel;

  UserSuccessState(this.departmentModel);
}

class UserFailureState extends UserState {
  final String error;

  UserFailureState(this.error);
}

class ChangeGroupValue extends UserState {}
