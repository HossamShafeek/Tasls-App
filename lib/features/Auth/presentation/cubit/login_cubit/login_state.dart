import 'package:tasks_app/features/Auth/data/models/login_model/login_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState(this.error);
}

class LoginChangePasswordVisibility extends LoginState {}

class LoginChangeKeepMeLoggedIn extends LoginState {}
