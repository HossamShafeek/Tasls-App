import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';

abstract class UpdateUserState {}

class UpdateUserInitialState extends UpdateUserState {}

class ChangeGroupValue extends UpdateUserState {}

class UpdateUserLoadingState extends UpdateUserState {}

class UpdateUserSuccessState extends UpdateUserState {
  final CreateUserModel updateUserModel;

  UpdateUserSuccessState(this.updateUserModel);
}

class UpdateUserFailureState extends UpdateUserState {
  final String error;

  UpdateUserFailureState(this.error);
}
