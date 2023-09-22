import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';

abstract class CreateUserState {}

class UserInitialState extends CreateUserState {}

class CreateUserLoadingState extends CreateUserState {}

class CreateUserSuccessState extends CreateUserState {
  final CreateUserModel createUserModel;

  CreateUserSuccessState(this.createUserModel);
}

class CreateUserFailureState extends CreateUserState {
  final String error;

  CreateUserFailureState(this.error);
}

class ChangeGroupValue extends CreateUserState {}
