import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class CreateUserLoadingState extends UserState {}

class CreateUserSuccessState extends UserState {
  final CreateUserModel createUserModel;

  CreateUserSuccessState(this.createUserModel);
}

class CreateUserFailureState extends UserState {
  final String error;

  CreateUserFailureState(this.error);
}

class ChangeGroupValue extends UserState {}