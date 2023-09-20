import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';

abstract class GetAllUsersState {}

class GetAllUserInitialState extends GetAllUsersState {}

class GetAllUsersLoadingState extends GetAllUsersState {}

class GetAllUsersSuccessState extends GetAllUsersState {
  final UsersModel usersModel;

  GetAllUsersSuccessState(this.usersModel);
}

class GetAllUsersFailureState extends GetAllUsersState {
  final String error;

  GetAllUsersFailureState(this.error);
}
